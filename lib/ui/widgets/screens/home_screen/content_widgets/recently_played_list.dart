import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/databases/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/screens/search_screen/bloc_no_results_state/no_results_widget.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecentlyPlayedList extends StatefulWidget {
  const RecentlyPlayedList({
    super.key,
  });

  @override
  State<RecentlyPlayedList> createState() => _RecentlyPlayedListState();
}

class _RecentlyPlayedListState extends State<RecentlyPlayedList> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<RecentlyPlayedBloc>(context)
        .add(FetchRecentlyPlayedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentlyPlayedBloc, RecentlyPlayedState>(
        builder: (context, state) {
      return state.map(
        error: (context) => const NoResultsWidget(),
        loading: (context) => const Center(
          child: CustomFadingCircleIndicator(),
        ),
        loaded: (data) => PlatformBuilder(
            web: ImageListView(chartItems: data.data),
            other: ImageScroll(chartItems: data.data),
            builder: (context, child, widget) {
              return widget;
            }),
      );
    });
  }
}

class ImageListView extends StatefulWidget {
  final List<RecentlyPlayedSong> chartItems;
  const ImageListView({
    required this.chartItems,
    super.key,
  });

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  final ScrollController _horizontalScroll = ScrollController();

  bool _canScrollBack = false;
  bool _canScrollForward = true;

  @override
  void initState() {
    super.initState();

    _horizontalScroll.addListener(() {
      setState(() {
        _canScrollBack = _horizontalScroll.position.pixels > 0;
        _canScrollForward = _horizontalScroll.position.pixels <
            _horizontalScroll.position.maxScrollExtent;
      });
    });
  }

  @override
  void dispose() {
    _horizontalScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(builder: (context, child, isHovered) {
      return Stack(
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            controller: _horizontalScroll,
            children: List.generate(widget.chartItems.length, (index) {
              return HoverableWidget(builder: (context, child, isHovered) {
                return RecentlyPlayedPageContent(
                    id: widget.chartItems[index].id,
                    isHovered: isHovered,
                    image: widget.chartItems[index].headerImageUrl,
                    artistName: widget.chartItems[index].artistNames,
                    title: widget.chartItems[index].title,
                    preview: widget.chartItems[index].preview);
              });
            }),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 60,
            child: CreateScrollButtons(
              canScrollBack: _canScrollBack,
              canScrollForward: _canScrollForward,
              horizontalScroll: _horizontalScroll,
              isHovered: isHovered,
            ),
          ),
        ],
      );
    });
  }
}

class ImageScroll extends StatelessWidget {
  final List<RecentlyPlayedSong> chartItems;
  const ImageScroll({
    required this.chartItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        narrow: 220.0,
        medium: 255.0,
        large: 285.0,
        builder: (context, child, height) {
          return SizedBox(
            width: double.infinity,
            height: height,
            child: InfiniteCarousel.builder(
              itemCount: chartItems.length,
              itemExtent: height + 10,
              center: false,
              anchor: 0.5,
              velocityFactor: 0.4,
              onIndexChanged: (index) {},
              controller: InfiniteScrollController(),
              axisDirection: Axis.horizontal,
              loop: true,
              itemBuilder: (context, index, realIndex) {
                return HoverableWidget(builder: (context, child, isHovered) {
                  return RecentlyPlayedPageContent(
                      id: chartItems[index].id,
                      image: chartItems[index].headerImageUrl,
                      artistName: chartItems[index].artistNames,
                      title: chartItems[index].title,
                      isHovered: isHovered,
                      preview: chartItems[index].preview);
                });
              },
            ),
          );
        });
  }
}

class RecentlyPlayedPageContent extends StatelessWidget {
  final int id;
  final String image;

  final String title;
  final String artistName;
  final String preview;
  final bool isHovered;
  const RecentlyPlayedPageContent(
      {super.key,
      required this.id,
      required this.image,
      required this.title,
      required this.preview,
      required this.isHovered,
      required this.artistName});

  void playPauseMusic(BuildContext context, MusicProvider musicProvider) {
    Provider.of<RecentlyPlayedIdProvider>(context, listen: false)
        .setId(id.toString());
    if (musicProvider.isCurrentlyPlaying(id)) {
      if (musicProvider.isPlaying) {
        musicProvider.pause();
      } else {
        musicProvider.play(musicProvider.playlist[0].preview);
      }
    } else {
      musicProvider.clearPlaylist();

      musicProvider.addSong(PlayedSong(id: id, preview: preview));
      musicProvider.play(preview);
      musicProvider.currentSongId = id;
    }
    musicProvider.musicCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 5, 16, 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            ResponsiveBuilder(
              narrow: 190.0,
              medium: 200.0,
              large: 235.0,
              builder: (context, child, height) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: height,
                    width: height,
                    child: child,
                  ),
                );
              },
              child: Image.network(image, fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: PlatformBuilder(
                  web: isHovered
                      ? CreatePlayButton(
                          onPressed: () {
                            playPauseMusic(context, musicProvider);
                          },
                          size: 45,
                          icon: (musicProvider.isPlaying &&
                                  musicProvider.isSongInPlaylist(id))
                              ? Icon(Icons.pause, color: AppColors.black.color)
                              : Icon(Icons.play_arrow,
                                  color: AppColors.black.color),
                          containerColor: AppColors.accent.color,
                        )
                      : Container(),
                  other: CreatePlayButton(
                    onPressed: () {
                      GoRouter.of(context).push(Uri(
                              path:
                                  '/${routeNameMap[RouteName.detailMusic]!}$id')
                          .toString());
                      playPauseMusic(context, musicProvider);
                    },
                    size: 40,
                    icon: (musicProvider.isPlaying &&
                            musicProvider.isSongInPlaylist(id))
                        ? Icon(Icons.pause, color: AppColors.white.color)
                        : Icon(Icons.play_arrow, color: AppColors.white.color),
                    containerColor: AppColors.accent.color.withOpacity(0.8),
                  ),
                  builder: (context, child, widget) {
                    return widget;
                  }),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        ResponsiveBuilder(
            narrow: 12.0,
            medium: 14.0,
            large: 14.0,
            builder: (context, child, size) {
              return CreateSongTitle(
                artistName: artistName,
                songTitle: TextModifierService().capitalizeFirstLetter(title),
                maxLines: 2,
                fontSize: size,
                minFontSize: 13,
              );
            }),
      ]),
    );
  }
}

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/screens/search_screen/bloc_loaded_state/search_section.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecentlyPlayedList extends StatelessWidget {
  const RecentlyPlayedList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteBloc = BlocProvider.of<RecentlyPlayedBloc>(context);
    favoriteBloc.add(FetchRecentlyPlayedEvent());
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
  late ScrollController _horizontalScroll;

  bool _canScrollBack = false;
  bool _canScrollForward = true;

  @override
  void initState() {
    super.initState();
    _horizontalScroll = ScrollController();
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

  @override
  Widget build(BuildContext context) {
    final song = PlayedSong(id: id, preview: preview);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 5, 16, 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            _CreateRecentlyPlayedImage(image: image),
            _CreatePlayButton(isHovered: isHovered, id: id, song: song),
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

class _CreatePlayButton extends StatelessWidget {
  const _CreatePlayButton({
    required this.isHovered,
    required this.id,
    required this.song,
  });

  final bool isHovered;
  final int id;
  final PlayedSong song;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 8,
      child: PlatformBuilder(
          web: isHovered
              ? CreatePlayPauseButton(
                  playedSong: song,
                  type: SearchFilters.track,
                )
              : const SizedBox(),
          other: CreatePlayPauseButton(
              type: SearchFilters.track,
              playedSong: song,
              onPressed: () => _onMobiePressed(context)),
          builder: (context, child, widget) {
            return widget;
          }),
    );
  }

  void _onMobiePressed(BuildContext context) {
    GoRouter.of(context).push(
        Uri(path: '/${routeNameMap[RouteName.detailMusic]!}$id').toString());
  }
}

class _CreateRecentlyPlayedImage extends StatelessWidget {
  const _CreateRecentlyPlayedImage({
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
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
    );
  }
}

import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/app/domain/entity/models.dart';
import 'package:audio_player/app/ui/navigation/navigation_routes.dart';
import 'package:audio_player/app/ui/widgets/screens/index.dart';
import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateResentlySearchedListView extends StatelessWidget {
  final double width;
  const CreateResentlySearchedListView({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentlySearchedBloc, RecentlySearchedState>(
        builder: (context, state) {
      if (state is LoadedRecentlySearchedState) {
        return _CreateResentlySearchedListView(
            width: width, recentlySearched: state.data);
      } else {
        return Container();
      }
    });
  }
}

class _CreateResentlySearchedListView extends StatefulWidget {
  final List<SongModel> recentlySearched;
  const _CreateResentlySearchedListView(
      {required this.width, required this.recentlySearched});

  final double width;

  @override
  State<_CreateResentlySearchedListView> createState() =>
      _CreateResentlySearchedListViewState();
}

class _CreateResentlySearchedListViewState
    extends State<_CreateResentlySearchedListView> {
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
          SizedBox(
            height: 200,
            child: RecentlySearchedListView(
              recentlySearched: widget.recentlySearched,
              horizontalScroll: _horizontalScroll,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 20,
            child: CreateScrollButtons(
                isHovered: isHovered,
                canScrollForward: _canScrollForward,
                horizontalScroll: _horizontalScroll,
                canScrollBack: _canScrollBack),
          ),
        ],
      );
    });
  }
}

class RecentlySearchedListView extends StatelessWidget {
  const RecentlySearchedListView({
    super.key,
    required this.recentlySearched,
    required ScrollController horizontalScroll,
  }) : _horizontalScroll = horizontalScroll;

  final ScrollController _horizontalScroll;
  final List<SongModel> recentlySearched;

  @override
  Widget build(BuildContext context) {
    const double listHeight = 70;
    return ListView.builder(
        itemCount: recentlySearched.length,
        scrollDirection: Axis.horizontal,
        controller: _horizontalScroll,
        itemBuilder: (context, index) {
          final song = recentlySearched[index];
          return GestureDetector(
            onTap: song.type == SearchFilters.album
                ? () {
                    String id = song.id;
                    GoRouter.of(context).push(Uri(
                      path: '/${Routes().albumDetail}$id',
                      queryParameters: {
                        'image': song.image,
                        'title': song.title,
                        'artist': song.artistNames
                      },
                    ).toString());
                  }
                : null,
            child: _CreateListViewContent(
              listHeight: listHeight,
              song: song,
            ),
          );
        });
  }
}

class _CreateListViewContent extends StatelessWidget {
  const _CreateListViewContent({
    required this.listHeight,
    required this.song,
  });

  final double listHeight;
  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: HoverableWidget(builder: (context, child, isHovered) {
        return Stack(
          children: [
            _CreateSongInfoLayer(song: song),
            Positioned.fill(
                child: _CreateButtonsLayer(
              song: song,
              isHovered: isHovered,
            ))
          ],
        );
      }),
    );
  }
}

class _CreateSongInfoLayer extends StatelessWidget {
  const _CreateSongInfoLayer({
    required this.song,
  });

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.1)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: song.type == SearchFilters.album
                  ? BorderRadius.circular(60)
                  : BorderRadius.circular(8),
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.network(
                  song.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          CreateSongTitle(
            artistName: song.artistNames,
            songTitle: song.title,
          ),
        ],
      ),
    );
  }
}

class _CreateButtonsLayer extends StatelessWidget {
  const _CreateButtonsLayer({
    required this.song,
    required this.isHovered,
  });

  final SongModel song;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButtonWidget(
          onPressed: () {
            final bloc = context.read<RecentlySearchedBloc>();
            bloc.add(RemoveFromRecentlySearchedEvent(song));
          },
          iconData: Icons.cancel,
          size: 30,
          color: AppColors.white.color,
        ),
        isHovered ? _CreatePlayMusicButton(playedSong: song) : Container()
      ],
    );
  }
}

class _CreatePlayMusicButton extends StatelessWidget {
  final SongModel playedSong;
  const _CreatePlayMusicButton({
    required this.playedSong,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AlbumDetailBloc>(builder: (context, albumBloc, child) {
      final song =
          PlayedSong(id: int.parse(playedSong.id), preview: playedSong.preview);
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CreatePlayPauseButton(
            playedSong: song,
            type: playedSong.type,
            playedSongs: _returnAlbumSongs(albumBloc.state)),
      );
    });
  }

  List<PlayedSong> _returnAlbumSongs(AlbumDetailBlocState state) {
    if (state is LoadedAlbumDetailBlocState) {
      final songs = state.albumDetailList
          .map((song) => PlayedSong(
                id: song.id,
                preview: song.preview,
              ))
          .toList();
      return songs;
    } else {
      return [];
    }
  }
}

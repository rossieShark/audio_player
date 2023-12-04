import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchListView extends StatefulWidget {
  const SearchListView({
    super.key,
    required this.searchResult,
  });
  final List<SearchData> searchResult;

  @override
  State<SearchListView> createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  final double tabBarWidth = 51;
  final double padding = 16;

  SearchResultBloc get searchBloc => BlocProvider.of<SearchResultBloc>(context);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(
        narrow: width,
        medium: width - tabBarWidth,
        large: width - tabBarWidth,
        builder: (context, child, widthVal) {
          return SizedBox(
            width: widthVal,
            height: (80 + padding) * widget.searchResult.length.toDouble(),
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(widget.searchResult.length, (index) {
                return HoverableWidget(builder: (context, child, isHovered) {
                  return GestureDetector(
                    onTap: () {
                      // int id = widget.searchResult[index].id;
                      // if ((widget.searchResult[index].type == 'track') &&
                      //     !isHovered) {
                      //   GoRouter.of(context).push(Uri(
                      //           path:
                      //               '/${routeNameMap[RouteName.detailMusic]!}$id')
                      //       .toString());
                      //   final bloc = context.read<RecentlySearchedBloc>();
                      //   bloc.add(AddToRecentlySearchedEvent(
                      //     SongModel(
                      //       type: widget.searchResult[index].type,
                      //       id: id.toString(),
                      //       preview: widget.searchResult[index].preview,
                      //       artistNames: widget.searchResult[index].artist.name,
                      //       title: widget.searchResult[index].title,
                      //       image: widget.searchResult[index].artist.image,
                      //       isFavourite: false,
                      //     ),
                      //   ));
                      // } else if ((widget.searchResult[index].type == 'track') &&
                      //     isHovered) {
                      //   null;
                      // } else {
                      int id = widget.searchResult[index].id;
                      GoRouter.of(context).push(Uri(
                        path: '/${routeNameMap[RouteName.albumDetail]!}$id',
                        queryParameters: {
                          'image': widget.searchResult[index].artist.image,
                          'title': widget.searchResult[index].title,
                          'artist': widget.searchResult[index].artist.name
                        },
                      ).toString());
                      final bloc = context.read<RecentlySearchedBloc>();
                      bloc.add(AddToRecentlySearchedEvent(
                        SongModel(
                          preview: widget.searchResult[index].preview,
                          type: widget.searchResult[index].type,
                          id: id.toString(),
                          artistNames: widget.searchResult[index].artist.name,
                          title: widget.searchResult[index].title,
                          image: widget.searchResult[index].artist.image,
                          isFavourite: false,
                        ),
                      ));
                      // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: CustomListViewContent(
                        imageSection: _CreateImageSection(
                            searchResult: widget.searchResult,
                            index: index,
                            listHeight: 80),
                        titleSection: CreateSongTitle(
                          artistName: widget.searchResult[index].artist.name,
                          songTitle: widget.searchResult[index].title,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  );
                });
              }),
            ),
          );
        });
  }
}

class _CreateImageSection extends StatelessWidget {
  const _CreateImageSection({
    required this.listHeight,
    required this.searchResult,
    required this.index,
  });

  final double listHeight;
  final List<SearchData> searchResult;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageinAlbum(
          size: listHeight,
          image: Image.network(searchResult[index].artist.image,
              fit: BoxFit.cover),
          type: searchResult[index].type,
        ),
        Positioned(
            left: 8,
            bottom: 0,
            top: 0,
            right: 16,
            child: HoverableWidget(builder: (context, child, isHovered) {
              return (isHovered && searchResult[index].type == 'track')
                  ? _CreatePlayButton(
                      playerSong: searchResult[index],
                      listHeight: listHeight,
                    )
                  : Container();
            }))
      ],
    );
  }
}

class _CreatePlayButton extends StatelessWidget {
  final SearchData playerSong;
  final double listHeight;
  const _CreatePlayButton({required this.playerSong, required this.listHeight});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(builder: (context, state) {
      bool isSongPlay = state.playlist.any((song) => song.id == playerSong.id);
      return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
              width: listHeight,
              height: listHeight,
              color: AppColors.black.color.withOpacity(0.5),
              child: CreatePlayButton(
                  size: 30,
                  icon: (state.isPlaying && isSongPlay)
                      ? Icon(Icons.pause, color: AppColors.white.color)
                      : Icon(Icons.play_arrow, color: AppColors.white.color),
                  onPressed: () {
                    final bloc = context.read<RecentlySearchedBloc>();
                    bloc.add(AddToRecentlySearchedEvent(
                      SongModel(
                        preview: playerSong.preview,
                        type: playerSong.type,
                        id: playerSong.id.toString(),
                        artistNames: playerSong.artist.name,
                        title: playerSong.title,
                        image: playerSong.artist.image,
                        isFavourite: false,
                      ),
                    ));
                    _playPauseMusic(context);
                  },
                  containerColor: Colors.transparent)));
    });
  }

  void _playPauseMusic(BuildContext context) {
    // context.read<RecentlyPlayedIdCubit>().setId(playerSong.id.toString());
    final musicBloc = context.read<MusicBloc>();
    final song = PlayedSong(id: playerSong.id, preview: playerSong.preview);
    musicBloc.add(PlayPause(song: song));
  }
}

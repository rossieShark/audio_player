import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/screens/search_screen/bloc_loaded_state/search_section.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
    required this.searchResult,
  });
  final List<SearchData> searchResult;

  @override
  Widget build(BuildContext context) {
    const double tabBarWidth = 51;
    const double padding = 16;
    const double listHeigth = 80;
    final width = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(
      narrow: width,
      medium: width - tabBarWidth,
      large: width - tabBarWidth,
      builder: (context, child, widthVal) {
        return SizedBox(
            width: widthVal,
            height: (listHeigth + padding) * searchResult.length.toDouble(),
            child: child);
      },
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 10),
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(searchResult.length, (index) {
          return HoverableWidget(builder: (context, child, isHovered) {
            final searchSong = searchResult[index];
            return GestureDetector(
              onTap: () => _onTap(context, searchSong, isHovered),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: CustomListViewContent(
                  imageSection: _CreateImageSection(
                      searchSong: searchSong, listHeight: listHeigth),
                  titleSection: CreateSongTitle(
                    artistName: searchSong.artist.name,
                    songTitle: searchSong.title,
                    maxLines: 2,
                  ),
                ),
              ),
            );
          });
        }),
      ),
    );
  }

  void _onTap(BuildContext context, SearchData searchSong, bool isHovered) {
    int id = searchSong.id;
    final bloc = context.read<RecentlySearchedBloc>();
    if ((searchSong.type == SearchFilters.track) && !isHovered) {
      GoRouter.of(context).push(
          Uri(path: '/${routeNameMap[RouteName.detailMusic]!}$id').toString());

      bloc.add(AddToRecentlySearchedEvent(
        SongModel(
            type: searchSong.type,
            id: id.toString(),
            preview: searchSong.preview,
            artistNames: searchSong.artist.name,
            title: searchSong.title,
            image: searchSong.artist.image,
            isFavourite: false),
      ));
    } else {
      int id = searchSong.id;
      GoRouter.of(context).push(Uri(
        path: '/${routeNameMap[RouteName.albumDetail]!}$id',
        queryParameters: {
          'image': searchSong.artist.image,
          'title': searchSong.title,
          'artist': searchSong.artist.name
        },
      ).toString());

      bloc.add(AddToRecentlySearchedEvent(
        SongModel(
          preview: searchSong.preview,
          type: searchSong.type,
          id: id.toString(),
          artistNames: searchSong.artist.name,
          title: searchSong.title,
          image: searchSong.artist.image,
          isFavourite: false,
        ),
      ));
    }
  }
}

class _CreateImageSection extends StatelessWidget {
  const _CreateImageSection({
    required this.listHeight,
    required this.searchSong,
  });

  final double listHeight;
  final SearchData searchSong;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageinAlbum(
          size: listHeight,
          image: Image.network(searchSong.artist.image, fit: BoxFit.cover),
          type: searchSong.type,
        ),
        Positioned(
            left: 8,
            bottom: 0,
            top: 0,
            right: 16,
            child: HoverableWidget(builder: (context, child, isHovered) {
              return (isHovered && searchSong.type == SearchFilters.track)
                  ? _CreatePlayButton(
                      playerSong: searchSong,
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
    final song = PlayedSong(id: playerSong.id, preview: playerSong.preview);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: listHeight,
        height: listHeight,
        color: AppColors.black.color.withOpacity(0.5),
        child: CreatePlayPauseButton(
          type: SearchFilters.track,
          playedSong: song,
          containerColor: Colors.transparent,
          onPressed: () => _addToRecentlySearched(context),
        ),
      ),
    );
  }

  void _addToRecentlySearched(BuildContext context) {
    final bloc = context.read<RecentlySearchedBloc>();
    bloc.add(
      AddToRecentlySearchedEvent(
        SongModel(
          preview: playerSong.preview,
          type: playerSong.type,
          id: playerSong.id.toString(),
          artistNames: playerSong.artist.name,
          title: playerSong.title,
          image: playerSong.artist.image,
          isFavourite: false,
        ),
      ),
    );
  }
}

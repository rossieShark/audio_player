import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_index.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyFavoriteAlbum extends StatefulWidget {
  const MyFavoriteAlbum({super.key});

  @override
  State<MyFavoriteAlbum> createState() => _MyFavoriteAlbumState();
}

class _MyFavoriteAlbumState extends State<MyFavoriteAlbum> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<FavoriteAlbumBloc>();
    bloc.add(const LoadFavoriteAlbumEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const FavoritePageStructure(
      child: FavoriteAlbumListView(),
    );
  }
}

class FavoriteAlbumListView extends StatelessWidget {
  const FavoriteAlbumListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteAlbumBloc, FavoriteAlbumState>(
        builder: (context, state) {
      return state.map(
          loading: (context) =>
              const Center(child: CustomFadingCircleIndicator()),
          noResults: (context) => const NoFavouritesTextWidget(),
          loaded: (data) => _CreateFavouriteAlbumListView(albums: data.data));
    });
  }
}

class _CreateFavouriteAlbumListView extends StatelessWidget {
  final List<SongModel> albums;
  const _CreateFavouriteAlbumListView({
    required this.albums,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: albums.length,
        separatorBuilder: (context, index) => const Divider(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final album = albums[index];
          return GestureDetector(
            onTap: () {
              String id = album.id;
              String image = album.image;

              GoRouter.of(context).push(Uri(
                path: '/${routeNameMap[RouteName.albumDetail]!}$id',
                queryParameters: {'image': image},
              ).toString());
            },
            child: Dismissible(
              key: Key(album.id),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: AppColors.accent.color,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                final bloc = context.read<FavoriteAlbumBloc>();
                bloc.add(RemoveAlbumsEvent(album));
              },
              child: CustomListViewContent(
                imageSection: ResponsiveBuilder(
                    narrow: 70.0,
                    medium: 90.0,
                    large: 90.0,
                    builder: (context, child, height) {
                      return CreateImageSection(song: album, height: height);
                    }),
                titleSection: CreateSongTitle(
                  artistName: album.artistNames,
                  songTitle: album.title,
                  maxLines: 2,
                ),
              ),
            ),
          );
        });
  }
}

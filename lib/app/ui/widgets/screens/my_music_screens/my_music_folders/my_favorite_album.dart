import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/domain/entity/favorite_song_model.dart';
import 'package:audio_player/app/ui/navigation/navigation_routes.dart';
import 'package:audio_player/app/ui/widgets/screens/my_music_screens/my_music_folders/widgets/common_favourite_list_biew_body.dart';
import 'package:audio_player/app/ui/widgets/screens/my_music_screens/my_music_index.dart';

import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyFavoriteAlbum extends StatelessWidget {
  const MyFavoriteAlbum({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteBloc = BlocProvider.of<FavoriteAlbumBloc>(context);
    favoriteBloc.add(const LoadFavoriteAlbumEvent());
    return FavoritePageStructure(
      child: BlocBuilder<FavoriteAlbumBloc, FavoriteAlbumState>(
          builder: (context, state) {
        return state.map(
            loading: (context) =>
                const Center(child: CustomFadingCircleIndicator()),
            noResults: (context) => const NoFavouritesTextWidget(),
            loaded: (data) => CreateFavouriteAlbumListView(albums: data.data));
      }),
    );
  }
}

class CreateFavouriteAlbumListView extends StatelessWidget {
  final List<SongModel> albums;
  const CreateFavouriteAlbumListView({
    super.key,
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
          final id = album.id;
          final image = album.image;
          return CommonFavouriteListViewBody(
            onTap: () => _onTap(id, image, context),
            song: album,
            onDismissed: () => _onDismissed(context, album),
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
          );
        });
  }

  void _onTap(String id, String image, BuildContext context) {
    GoRouter.of(context).push(Uri(
      path: '/${Routes().albumDetail}$id',
      queryParameters: {'image': image},
    ).toString());
  }

  void _onDismissed(BuildContext context, SongModel album) {
    final bloc = context.read<FavoriteAlbumBloc>();
    bloc.add(RemoveAlbumsEvent(album));
  }
}

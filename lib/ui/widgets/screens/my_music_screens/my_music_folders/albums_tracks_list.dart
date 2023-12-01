import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/widgets/playlist_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlbumTracksListView extends StatelessWidget {
  const AlbumTracksListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<FavoriteFolder> folders = initializeFolders(context);
    return SizedBox(
      height: 60 * folders.length.toDouble(),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: folders.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            List<FavoriteFolder> folders = initializeFolders(context);
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  GoRouter.of(context)
                      .push('/${routeNameMap[RouteName.favoriteAlbums]!}');
                } else {
                  GoRouter.of(context)
                      .push('/${routeNameMap[RouteName.favoriteTracks]!}');
                }
              },
              child: PlaylistCard(index: index, folders: folders),
            );
          }),
    );
  }
}

List<FavoriteFolder> initializeFolders(BuildContext context) {
  return [
    FavoriteFolder(
      image: AppImages.album,
      title: AppLocalizations.of(context)!.albumsFolder,
    ),
    FavoriteFolder(
      image: AppImages.track,
      title: AppLocalizations.of(context)!.tracksFolder,
    ),
  ];
}

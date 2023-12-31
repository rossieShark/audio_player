import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/domain/entity/models.dart';
import 'package:audio_player/app/ui/navigation/navigation_routes.dart';
import 'package:audio_player/app/ui/widgets/screens/my_music_screens/widgets/playlist_card.dart';

import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewFoldersBlocBuilder extends StatelessWidget {
  const NewFoldersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPlaylistBloc, NewPlaylistState>(
        builder: (context, state) {
      return state.map(
        empty: (context) => const SizedBox(),
        loaded: (folders) => NewFolddersListView(
          folders: folders.folders,
        ),
      );
    });
  }
}

class NewFolddersListView extends StatelessWidget {
  final List<FavoriteFolder> folders;
  const NewFolddersListView({
    super.key,
    required this.folders,
  });

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(builder: (context, child, isHovered) {
      return SizedBox(
        height: 60 * folders.length.toDouble(),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: folders.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.push('/${Routes().playlist}');
                },
                child: PlaylistCard(index: index, folders: folders),
              );
            }),
      );
    });
  }
}

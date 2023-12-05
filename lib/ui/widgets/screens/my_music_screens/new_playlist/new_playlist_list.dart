import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/widgets/playlist_card.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class NewFoldersBlocBuilder extends StatelessWidget {
  const NewFoldersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPlaylistBloc, NewPlaylistState>(
        builder: (context, state) {
      return state.map(
        empty: (context) => const SizedBox(),
        loaded: (folders) => _NewFolddersListView(
          folders: folders.folders,
        ),
      );
    });
  }
}

class _NewFolddersListView extends StatelessWidget {
  final List<FavoriteFolder> folders;
  const _NewFolddersListView({
    required this.folders,
  });

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(builder: (context, child, isHovered) {
      print(folders.length);
      return SizedBox(
        height: 60 * folders.length.toDouble(),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: folders.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: PlaylistCard(index: index, folders: folders),
              );
            }),
      );
    });
  }
}

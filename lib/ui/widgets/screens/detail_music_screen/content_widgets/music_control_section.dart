import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/played_song_model.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';

import 'package:flutter/material.dart';

class CreatMusicControlSection extends StatefulWidget {
  final DetailInfoSong songInfo;
  const CreatMusicControlSection({super.key, required this.songInfo});

  @override
  State<CreatMusicControlSection> createState() =>
      _CreatMusicControlSectionState();
}

class _CreatMusicControlSectionState extends State<CreatMusicControlSection> {
  @override
  Widget build(BuildContext context) {
    final song =
        PlayedSong(id: widget.songInfo.id, preview: widget.songInfo.preview);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButtonWidget(
            iconData: Icons.repeat,
            size: 20,
            color: AppColors.accent.color,
            onPressed: () {}),
        _MusicControlSection(song: song, widget: widget),
        IconButtonWidget(
            iconData: Icons.shuffle,
            size: 20,
            color: AppColors.accent.color,
            onPressed: () {}),
      ],
    );
  }
}

class _MusicControlSection extends StatelessWidget {
  const _MusicControlSection({
    super.key,
    required this.song,
    required this.widget,
  });

  final PlayedSong song;
  final CreatMusicControlSection widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: IconButtonWidget(
              iconData: Icons.fast_rewind,
              size: 20,
              color: AppColors.white.color,
              onPressed: () {
                final musicBloc = context.read<MusicBloc>();
                musicBloc.add(PlayPrevious());
              }),
        ),
        const SizedBox(
          width: 10,
        ),
        CreatePlayPauseButton(
            playedSong: song, id: widget.songInfo.id.toString()),
        const SizedBox(
          width: 10,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: IconButtonWidget(
              iconData: Icons.fast_forward,
              size: 20,
              color: AppColors.white.color,
              onPressed: () {
                final musicBloc = context.read<MusicBloc>();
                musicBloc.add(PlayNext());
              }),
        ),
      ],
    );
  }
}

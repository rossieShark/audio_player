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
        Row(
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
            _CreatePlayPauseButton(playedSong: song),
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
        ),
        IconButtonWidget(
            iconData: Icons.shuffle,
            size: 20,
            color: AppColors.accent.color,
            onPressed: () {}),
      ],
    );
  }
}

class _CreatePlayPauseButton extends StatelessWidget {
  final PlayedSong playedSong;
  const _CreatePlayPauseButton({required this.playedSong});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(builder: (context, state) {
      bool isSongPlay = state.playlist.any((song) => song.id == playedSong.id);
      return CreatePlayButton(
        size: 40,
        containerColor: AppColors.accent.color,
        icon: state.isPlaying && isSongPlay
            ? Icon(Icons.pause, color: AppColors.white.color)
            : Icon(Icons.play_arrow, color: AppColors.white.color),
        onPressed: () => _playPauseMusic(context),
      );
    });
  }

  void _playPauseMusic(BuildContext context) {
    // context.read<RecentlyPlayedIdCubit>().setId(playedSong.id.toString());
    final musicBloc = context.read<MusicBloc>();
    final song = PlayedSong(id: playedSong.id, preview: playedSong.preview);
    musicBloc.add(PlayPause(song: song));
  }
}

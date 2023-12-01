import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/played_song_model.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreatePlayPauseButton extends StatelessWidget {
  final PlayedSong playedSong;
  final VoidCallback? onPressed;
  final String id;
  const CreatePlayPauseButton(
      {super.key, required this.playedSong, this.onPressed, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(builder: (context, state) {
      bool isSongPlay = state.playlist.any((song) => song.id == playedSong.id);
      return CreatePlayButton(
        onPressed: () {
          onPressed ?? () {};
          _playPauseMusic(context);
        },
        size: 40,
        icon: (state.isPlaying && isSongPlay)
            ? Icon(Icons.pause, color: AppColors.white.color)
            : Icon(Icons.play_arrow, color: AppColors.white.color),
        containerColor: AppColors.accent.color.withOpacity(0.8),
      );
    });
  }

  void _playPauseMusic(BuildContext context) {
    final musicBloc = context.read<MusicBloc>();
    musicBloc.add(PlayPause(song: playedSong));
  }
}

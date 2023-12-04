import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/played_song_model.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreatePlayPauseButton extends StatelessWidget {
  final PlayedSong playedSong;
  final List<PlayedSong>? playedSongs;
  final VoidCallback? onPressed;

  final String? type;
  const CreatePlayPauseButton(
      {super.key,
      required this.playedSong,
      this.onPressed,
      this.playedSongs,
      this.type});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(builder: (context, state) {
      // bool isSongPlay = state.playlist.any((song) => song.id == playedSong.id);
      return CreatePlayButton(
        onPressed: () {
          onPressed ?? () {};
          _playPauseMusic(context);
        },
        size: 40,
        icon: (state.isPlaying && isSongPlay(state))
            ? Icon(Icons.pause, color: AppColors.white.color)
            : Icon(Icons.play_arrow, color: AppColors.white.color),
        containerColor: AppColors.accent.color.withOpacity(0.8),
      );
    });
  }

  void _playPauseMusic(BuildContext context) {
    final musicBloc = context.read<MusicBloc>();
    if (type == 'track') {
      musicBloc.add(PlayPause(song: playedSong));
    } else {
      if (playedSongs != null) {
        musicBloc.add(PlayPlaylist(songs: playedSongs!, song: playedSongs![0]));
      }
    }
  }

  bool isSongPlay(MusicState state) {
    if (type == 'track') {
      return state.playlist.any((song) => song.id == playedSong.id);
    } else {
      final isSongplay =
          state.playlist.any((song) => song.id == playedSongs![0].id);
      return isSongplay;
    }
  }
}

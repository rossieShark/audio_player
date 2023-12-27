import 'package:audio_player/app/domain/entity/models.dart';

class MusicState {
  final List<PlayedSong> playlist;
  final int currentSongIndex;
  final int currentSongId;
  final bool isPlaying;

  MusicState({
    required this.playlist,
    required this.currentSongIndex,
    required this.currentSongId,
    required this.isPlaying,
  });

  // Copy constructor for creating a new state with some modifications
  MusicState copyWith({
    List<PlayedSong>? playlist,
    int? currentSongIndex,
    int? currentSongId,
    bool? isPlaying,
  }) {
    return MusicState(
      playlist: playlist ?? this.playlist,
      currentSongIndex: currentSongIndex ?? this.currentSongIndex,
      currentSongId: currentSongId ?? this.currentSongId,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

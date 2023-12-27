// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audio_player/app/domain/entity/models.dart';

abstract class MusicEvent {}

class AddSong extends MusicEvent {
  final PlayedSong song;
  AddSong({
    required this.song,
  });
}

class AddMultipleSongs extends MusicEvent {
  final List<PlayedSong> songs;
  AddMultipleSongs({
    required this.songs,
  });
}

class ClearPlaylist extends MusicEvent {}

class Play extends MusicEvent {
  final PlayedSong song;
  Play({
    required this.song,
  });
}

class Pause extends MusicEvent {}

class Resume extends MusicEvent {}

class PlayPause extends MusicEvent {
  final PlayedSong song;
  PlayPause({
    required this.song,
  });
}

class Stop extends MusicEvent {}

class PlayPlaylist extends MusicEvent {
  final List<PlayedSong> songs;
  final PlayedSong song;
  PlayPlaylist({
    required this.songs,
    required this.song,
  });
}

class PlayNext extends MusicEvent {}

class PlayPrevious extends MusicEvent {}

class MusicCompleted extends MusicEvent {}

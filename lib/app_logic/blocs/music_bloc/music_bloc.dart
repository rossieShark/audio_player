import 'package:audio_player/app_logic/blocs/music_bloc/music_bloc_event.dart';
import 'package:audio_player/app_logic/blocs/music_bloc/music_bloc_state.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final AudioPlayer _audioPlayer;

  MusicBloc(this._audioPlayer)
      : super(MusicState(
            playlist: [],
            currentSongIndex: 0,
            currentSongId: -1,
            isPlaying: false)) {
    on<AddSong>(_onAddSong);
    on<AddMultipleSongs>(_onAddMultipleSongs);
    on<ClearPlaylist>(_onClearPlaylist);
    on<Play>(_onPlay);
    on<Pause>(_onPause);
    on<Stop>(_onStop);
    on<PlayNext>(_onPlayNext);
    on<PlayPrevious>(_onPlayPrevious);
    on<PlayPause>(_onPlayPause);
    on<PlayPlaylist>(_onPlayPlaylist);
    _setupMusicCompletedSubscription();
  }
  AudioPlayer get audioPlayer => _audioPlayer;
  void _setupMusicCompletedSubscription() {
    _audioPlayer.onPlayerStateChanged.listen((audioState) {
      if (audioState == PlayerState.completed) {
        if (state.playlist.length == 1 || state.playlist.isEmpty) {
          _audioPlayer.stop();
        } else {
          add(PlayNext());
        }
      }
    });
  }

  void _onAddSong(AddSong event, Emitter<MusicState> emit) async {
    final songs = state.playlist;
    songs.add(event.song);
    add(Play(song: event.song));
    emit(state.copyWith(playlist: songs));
  }

  void _onAddMultipleSongs(
      AddMultipleSongs event, Emitter<MusicState> emit) async {
    final songs = state.playlist;
    songs.addAll(event.songs);
    add(Play(song: songs[0]));
    print(songs.length);
    emit(state.copyWith(playlist: songs));
  }

  void _onClearPlaylist(ClearPlaylist event, Emitter<MusicState> emit) async {
    emit(state.copyWith(
        playlist: [],
        currentSongId: -1,
        currentSongIndex: 0,
        isPlaying: false));
  }

  void _onPlay(Play event, Emitter<MusicState> emit) async {
    await _audioPlayer.play(UrlSource(event.song.preview));
    emit(state.copyWith(isPlaying: true, currentSongId: event.song.id));
  }

  void _onPause(Pause event, Emitter<MusicState> emit) async {
    await _audioPlayer.pause();
    emit(state.copyWith(isPlaying: false));
  }

  void _onStop(Stop event, Emitter<MusicState> emit) async {
    await _audioPlayer.stop();
    emit(state.copyWith(isPlaying: false));
  }

  void _onPlayNext(PlayNext event, Emitter<MusicState> emit) async {
    if (state.currentSongIndex < state.playlist.length - 1) {
      final currentIndex = state.currentSongIndex + 1;
      add(Play(song: state.playlist[currentIndex]));
      emit(state.copyWith(currentSongIndex: currentIndex));
    } else {
      final currentIndex = 0;
      add(Play(song: state.playlist[currentIndex]));
      emit(state.copyWith(currentSongIndex: 0));
    }
  }

  void _onPlayPrevious(PlayPrevious event, Emitter<MusicState> emit) async {
    if (state.currentSongIndex > 0) {
      final currentIndex = state.currentSongIndex - 1;
      add(Play(song: state.playlist[currentIndex]));
      emit(state.copyWith(currentSongIndex: currentIndex));
    } else {
      final currentIndex = state.playlist.length - 1;
      add(Play(song: state.playlist[currentIndex]));
      emit(state.copyWith(currentSongIndex: currentIndex));
    }
  }

  void _onPlayPause(PlayPause event, Emitter<MusicState> emit) async {
    if (state.currentSongId == event.song.id) {
      if (state.isPlaying) {
        add(Pause());
      } else {
        add(Play(song: state.playlist[0]));
      }
    } else {
      add(ClearPlaylist());
      add(AddSong(song: event.song));

      emit(state.copyWith(currentSongId: event.song.id));
    }
  }

  void _onPlayPlaylist(PlayPlaylist event, Emitter<MusicState> emit) async {
    if (state.isPlaying) {
      add(Pause());
    } else {
      add(ClearPlaylist());
      add(AddMultipleSongs(songs: event.songs));
    }
  }

  int _calculateNextIndex() {
    return (state.currentSongIndex < state.playlist.length - 1)
        ? state.currentSongIndex + 1
        : 0;
  }

  int _calculatePreviousIndex() {
    return (state.currentSongIndex > 0)
        ? state.currentSongIndex - 1
        : state.playlist.length - 1;
  }

  void _playSongByIndex(int index) {
    add(Play(song: state.playlist[index]));
  }
}

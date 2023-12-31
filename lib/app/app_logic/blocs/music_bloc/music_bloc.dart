import 'package:audio_player/app/app_logic/blocs/music_bloc/music_bloc_event.dart';
import 'package:audio_player/app/app_logic/blocs/music_bloc/music_bloc_state.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
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
    on<Resume>(_onResume);
    _setupMusicCompletedSubscription();
  }
  AudioPlayer get audioPlayer => _audioPlayer;
  void _setupMusicCompletedSubscription() {
    _audioPlayer.onPlayerStateChanged.listen((audioState) {
      if (audioState == PlayerState.completed) {
        if (state.playlist.length == 1 || state.playlist.isEmpty) {
          add(Stop());
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

  void _onResume(Resume event, Emitter<MusicState> emit) async {
    await _audioPlayer.resume();
    emit(state.copyWith(isPlaying: true));
  }

  void _onStop(Stop event, Emitter<MusicState> emit) async {
    await _audioPlayer.stop();
    emit(state.copyWith(isPlaying: false));
  }

  void _onPlayNext(PlayNext event, Emitter<MusicState> emit) async {
    final currentIndex = _calculateNextIndex();
    _playSongByIndex(currentIndex);
    emit(state.copyWith(currentSongIndex: currentIndex));
  }

  void _onPlayPrevious(PlayPrevious event, Emitter<MusicState> emit) async {
    final currentIndex = _calculatePreviousIndex();
    _playSongByIndex(currentIndex);
    emit(state.copyWith(currentSongIndex: currentIndex));
  }

  void _onPlayPause(PlayPause event, Emitter<MusicState> emit) async {
    if (state.currentSongId == event.song.id) {
      if (state.isPlaying) {
        add(Pause());
      } else {
        add(Resume());
      }
    } else {
      add(ClearPlaylist());
      add(AddSong(song: event.song));

      emit(state.copyWith(currentSongId: event.song.id));
    }
  }

  void _onPlayPlaylist(PlayPlaylist event, Emitter<MusicState> emit) async {
    if (state.playlist.any((song) => song.id == event.songs[0].id)) {
      if (state.isPlaying) {
        add(Pause());
      } else {
        add(Resume());
      }
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

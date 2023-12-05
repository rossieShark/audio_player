import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';
import 'package:audio_player/domain/repositories/favourites_repository.dart/favourite_song_repository.dart';

class FavoriteSongBloc extends Bloc<FavoriteSongEvent, FavouriteSongState> {
  final FavouriteSongRepository _repository;

  FavoriteSongBloc(
    this._repository,
  ) : super(const FavouriteSongState.loading()) {
    on<AddSongsEvent>(_onAddSongs);
    on<LoadFavouriteSongsEvent>(_onLoadSongs);
    on<ToggleIsFavourite>(_onToggleFavouriteSong);
    on<RemoveSongsEvent>(_onRemoveSong);
    on<SortSongsEvent>(_onSorting);
  }
  bool _isSorted = false;
  void _onAddSongs(
      AddSongsEvent event, Emitter<FavouriteSongState> emit) async {
    List<SongModel> songs = await _returnFavouriteSongsList();
    songs.add(event.song);
    await _repository.addToFavorites(event.song);
    emit(FavouriteSongState.loaded(data: songs));
  }

  void _onLoadSongs(
      LoadFavouriteSongsEvent event, Emitter<FavouriteSongState> emit) async {
    List<SongModel> songs = await _returnFavouriteSongsList();
    if (songs.isEmpty) {
      emit(const FavouriteSongState.noResults());
    } else {
      emit(FavouriteSongState.loaded(data: songs));
    }
  }

  void _onToggleFavouriteSong(
      ToggleIsFavourite event, Emitter<FavouriteSongState> emit) async {
    List<SongModel> songs = await _returnFavouriteSongsList();
    bool isFavorite = songs.any((song) => song.id == event.detailSong.id);
    if (isFavorite) {
      add(RemoveSongsEvent(event.detailSong));
    } else {
      add(AddSongsEvent(event.detailSong));
    }
  }

  void _onRemoveSong(
      RemoveSongsEvent event, Emitter<FavouriteSongState> emit) async {
    List<SongModel> songs = await _returnFavouriteSongsList();
    songs.removeWhere((item) => item.id == event.detailSong.id);
    await _repository.removeSongFromDatabase(event.detailSong);
    if (songs.isEmpty) {
      emit(const FavouriteSongState.noResults());
    } else {
      emit(FavouriteSongState.loaded(data: songs));
    }
  }

  void _onSorting(
      SortSongsEvent event, Emitter<FavouriteSongState> emit) async {
    List<SongModel> songs = await _returnFavouriteSongsList();

    if (_isSorted) {
      // If already sorted, return the original list
      emit(FavouriteSongState.loaded(data: songs));
    } else {
      // Sort the list
      songs.sort((a, b) => a.artistNames.compareTo(b.artistNames));
      print(songs[0].artistNames);
      emit(FavouriteSongState.loaded(data: songs));
    }

    // Toggle the sorting state
    _isSorted = !_isSorted;
  }

  Future<List<SongModel>> _returnFavouriteSongsList() async {
    return await _repository.loadSongs();
  }
}

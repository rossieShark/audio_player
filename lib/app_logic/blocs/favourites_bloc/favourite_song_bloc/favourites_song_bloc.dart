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
  bool get isSorted => _isSorted;
  void _onAddSongs(
      AddSongsEvent event, Emitter<FavouriteSongState> emit) async {
    final songs = await _repository.addToFavorites(event.song);
    emit(FavouriteSongState.loaded(data: songs));
  }

  void _onLoadSongs(
      LoadFavouriteSongsEvent event, Emitter<FavouriteSongState> emit) async {
    List<SongModel> songs = await _repository.loadSongs();
    if (songs.isEmpty) {
      emit(const FavouriteSongState.noResults());
    } else {
      emit(FavouriteSongState.loaded(data: songs));
    }
  }

  void _onToggleFavouriteSong(
      ToggleIsFavourite event, Emitter<FavouriteSongState> emit) async {
    bool isFavorite = await _repository.isFavourite(event.detailSong.id);
    if (isFavorite) {
      add(RemoveSongsEvent(event.detailSong));
    } else {
      add(AddSongsEvent(event.detailSong));
    }
  }

  void _onRemoveSong(
      RemoveSongsEvent event, Emitter<FavouriteSongState> emit) async {
    final songs = await _repository.removeSongFromDatabase(event.detailSong);
    if (songs.isEmpty) {
      emit(const FavouriteSongState.noResults());
    } else {
      emit(FavouriteSongState.loaded(data: songs));
    }
  }

  void _onSorting(
      SortSongsEvent event, Emitter<FavouriteSongState> emit) async {
    List<SongModel> songs = await _repository.loadSongs();

    if (_isSorted) {
      // If already sorted, return the original list
      emit(FavouriteSongState.loaded(data: songs));
    } else {
      // Sort the list
      songs.sort((a, b) => a.artistNames.compareTo(b.artistNames));
      emit(FavouriteSongState.loaded(data: songs));
    }

    // Toggle the sorting state
    _isSorted = !_isSorted;
  }
}

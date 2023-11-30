import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';
import 'package:audio_player/domain/services/database_service/database_service.dart';

class FavoriteSongBloc extends Bloc<FavoriteSongEvent, FavouriteSongState> {
  final DatabaseService _databaseService;

  FavoriteSongBloc(
    this._databaseService,
  ) : super(const FavouriteSongState.loading()) {
    on<AddSongsEvent>(_onAddSongs);
    on<LoadFavouriteSongsEvent>(_onLoadSongs);
    on<ToggleIsFavourite>(_onToggleFavouriteSong);
    on<RemoveSongsEvent>(_onRemoveSong);
    on<SortSongsEvent>(_onSorting);
  }

  void _onAddSongs(
      AddSongsEvent event, Emitter<FavouriteSongState> emit) async {
    List<SongModel> songs = await _returnFavouriteSongsList();
    songs.add(event.song);
    await _databaseService.addToFavorites(event.song);
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
    await _databaseService.removeSongFromDatabase(event.detailSong);
    emit(FavouriteSongState.loaded(data: songs));
  }

  void _onSorting(
      SortSongsEvent event, Emitter<FavouriteSongState> emit) async {
    List<SongModel> songs = await _returnFavouriteSongsList();
    songs.sort((a, b) => a.artistNames.compareTo(b.artistNames));
    print(songs[0].artistNames);
    emit(FavouriteSongState.loaded(data: songs));
  }

  Future<List<SongModel>> _returnFavouriteSongsList() async {
    return await _databaseService.loadSongs();
  }
}

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';
import 'package:audio_player/services/database_service.dart';

class FavoriteAlbumBloc extends Bloc<FavoriteAlbumEvent, FavoriteAlbumState> {
  final DatabaseService _databaseService;

  FavoriteAlbumBloc(
    this._databaseService,
  ) : super(const FavoriteAlbumState.loading()) {
    on<AddAlbumEvent>(_onAddAlbums);
    on<LoadFavoriteAlbumEvent>(_onLoadAlbums);
    on<ToggleIsFavouriteAlbum>(_onToggleFavouriteAlbum);
    on<RemoveAlbumsEvent>(_onRemoveAlbum);
    on<SortAlbumsEvent>(_onSortingAlbum);
  }

  void _onAddAlbums(
      AddAlbumEvent event, Emitter<FavoriteAlbumState> emit) async {
    List<SongModel> albums = await _returnFavouriteAlbumsList();
    albums.add(event.albums);
    await _databaseService.addToFavoritesAlbum(event.albums);
    emit(FavoriteAlbumState.loaded(data: albums));
  }

  void _onLoadAlbums(
      LoadFavoriteAlbumEvent event, Emitter<FavoriteAlbumState> emit) async {
    List<SongModel> albums = await _returnFavouriteAlbumsList();
    if (albums.isEmpty) {
      emit(const FavoriteAlbumState.noResults());
    } else {
      emit(FavoriteAlbumState.loaded(data: albums));
    }
  }

  void _onToggleFavouriteAlbum(
      ToggleIsFavouriteAlbum event, Emitter<FavoriteAlbumState> emit) async {
    List<SongModel> albums = await _returnFavouriteAlbumsList();
    bool isFavorite = albums.any((song) => song.id == event.album.id);
    if (isFavorite) {
      add(RemoveAlbumsEvent(event.album));
    } else {
      add(AddAlbumEvent(event.album));
    }
  }

  void _onRemoveAlbum(
      RemoveAlbumsEvent event, Emitter<FavoriteAlbumState> emit) async {
    List<SongModel> albums = await _returnFavouriteAlbumsList();
    albums.removeWhere((item) => item.id == event.album.id);
    await _databaseService.removeFromFavoritesAlbum(event.album);
    emit(FavoriteAlbumState.loaded(data: albums));
  }

  void _onSortingAlbum(
      SortAlbumsEvent event, Emitter<FavoriteAlbumState> emit) async {
    List<SongModel> albums = await _returnFavouriteAlbumsList();
    albums.sort((a, b) => a.artistNames.compareTo(b.artistNames));
    emit(FavoriteAlbumState.loaded(data: albums));
  }

  Future<List<SongModel>> _returnFavouriteAlbumsList() async {
    return await _databaseService.loadAlbums();
  }
}

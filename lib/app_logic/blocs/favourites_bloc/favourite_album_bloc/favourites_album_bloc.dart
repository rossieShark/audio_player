import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';
import 'package:audio_player/domain/repositories/favourites_repository.dart/favourite_album_repository.dart';

class FavoriteAlbumBloc extends Bloc<FavoriteAlbumEvent, FavoriteAlbumState> {
  final FavouriteAlbumRepository _repository;

  FavoriteAlbumBloc(
    this._repository,
  ) : super(const FavoriteAlbumState.loading()) {
    on<AddAlbumEvent>(_onAddAlbums);
    on<LoadFavoriteAlbumEvent>(_onLoadAlbums);
    on<ToggleIsFavouriteAlbum>(_onToggleFavouriteAlbum);
    on<RemoveAlbumsEvent>(_onRemoveAlbum);
    on<SortAlbumsEvent>(_onSortingAlbum);
  }
  bool _isSorted = false;
  bool get isSorted => _isSorted;
  void _onAddAlbums(
      AddAlbumEvent event, Emitter<FavoriteAlbumState> emit) async {
    final albums = await _repository.addToFavoritesAlbum(event.albums);
    emit(FavoriteAlbumState.loaded(data: albums));
  }

  void _onLoadAlbums(
      LoadFavoriteAlbumEvent event, Emitter<FavoriteAlbumState> emit) async {
    final albums = await _repository.loadAlbums();
    if (albums.isEmpty) {
      emit(const FavoriteAlbumState.noResults());
    } else {
      emit(FavoriteAlbumState.loaded(data: albums));
    }
  }

  void _onToggleFavouriteAlbum(
      ToggleIsFavouriteAlbum event, Emitter<FavoriteAlbumState> emit) async {
    bool isFavorite = await _repository.isFavourite(event.album.id);
    if (isFavorite) {
      add(RemoveAlbumsEvent(event.album));
    } else {
      add(AddAlbumEvent(event.album));
    }
  }

  void _onRemoveAlbum(
      RemoveAlbumsEvent event, Emitter<FavoriteAlbumState> emit) async {
    final albums = await _repository.removeFromFavoritesAlbum(event.album);
    if (albums.isEmpty) {
      emit(const FavoriteAlbumState.noResults());
    } else {
      emit(FavoriteAlbumState.loaded(data: albums));
    }
  }

  void _onSortingAlbum(
      SortAlbumsEvent event, Emitter<FavoriteAlbumState> emit) async {
    List<SongModel> albums = await _repository.loadAlbums();
    if (_isSorted) {
      // If already sorted, return the original list
      emit(FavoriteAlbumState.loaded(data: albums));
    } else {
      // Sort the list
      albums.sort((a, b) => a.artistNames.compareTo(b.artistNames));
      emit(FavoriteAlbumState.loaded(data: albums));
    }

    // Toggle the sorting state
    _isSorted = !_isSorted;
  }
}

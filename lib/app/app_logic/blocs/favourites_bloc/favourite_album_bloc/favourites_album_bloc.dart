import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/domain/entity/favorite_song_model.dart';
import 'package:audio_player/app/domain/repositories/favourites_repository.dart/favourites_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteAlbumBloc extends Bloc<FavoriteAlbumEvent, FavoriteAlbumState> {
  final Favourites _repository;

  FavoriteAlbumBloc(
    @Named("favouriteAlbums") this._repository,
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
    final albums = await _repository.addToFavorites(event.albums);
    emit(FavoriteAlbumState.loaded(data: albums));
  }

  void _onLoadAlbums(
      LoadFavoriteAlbumEvent event, Emitter<FavoriteAlbumState> emit) async {
    final albums = await _repository.loadFavourites();
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
    final albums = await _repository.removeFromFavorites(event.album);
    if (albums.isEmpty) {
      emit(const FavoriteAlbumState.noResults());
    } else {
      emit(FavoriteAlbumState.loaded(data: albums));
    }
  }

  void _onSortingAlbum(
      SortAlbumsEvent event, Emitter<FavoriteAlbumState> emit) async {
    List<SongModel> albums = await _repository.loadFavourites();
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

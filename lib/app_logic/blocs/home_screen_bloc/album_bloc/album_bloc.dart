import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/services/services.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumBlocState> {
  final AlbumRepository repository;

  AlbumBloc(this.repository) : super(const AlbumBlocState.loading()) {
    on<FetchAlbumsEvent>(_fetchAlbums);
  }

  void _fetchAlbums(
      FetchAlbumsEvent event, Emitter<AlbumBlocState> emit) async {
    try {
      final albums = await repository.getAlbums();
      if (albums.isEmpty) {
        emit(const AlbumBlocState.loading());
      } else {
        emit(AlbumBlocState.loaded(data: albums));
      }
    } catch (error) {
      emit(const AlbumBlocState.error());
      print('Error fetching song detail: $error');
    }
  }
}

class AlbumRepository {
  final BestAlbumsPaginationService _service;
  AlbumRepository(this._service);

  Future<List<BestAlbum>> getAlbums() async {
    await _service.loadMoreItems();
    return _service.items;
  }
}

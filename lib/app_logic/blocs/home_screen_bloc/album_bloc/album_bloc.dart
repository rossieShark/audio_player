import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/repositories/home_screen_repositories/best_album_repo.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@injectable
class AlbumBloc extends Bloc<AlbumEvent, AlbumBlocState> {
  final AlbumRepository repository;
  final Logger _logger = getLogger('AlbumBloc');
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
    } catch (error, stackTrace) {
      emit(const AlbumBlocState.error());
      _logger.severe(
          'Error fetching song detail: $error, stack trace: $stackTrace');
    }
  }
}

@injectable
class AlbumRepository {
  final BestAlbumsPagination _service;
  AlbumRepository(this._service);

  Future<List<Album>> getAlbums() async {
    await _service.loadMoreItems();
    return _service.items;
  }
}

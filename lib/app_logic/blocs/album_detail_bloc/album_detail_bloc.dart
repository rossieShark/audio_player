import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/repositories/index.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@injectable
class AlbumDetailBloc extends Bloc<AlbumDetailBlocEvent, AlbumDetailBlocState> {
  final AlbumDetails repository;
  final Logger _logger = getLogger('AlbumDetailBloc');
  AlbumDetailBloc(this.repository)
      : super(const AlbumDetailBlocState.loading()) {
    on<FetchAlbumDetailBlocEvent>(_fetchAlbumDetail);
  }

  void _fetchAlbumDetail(FetchAlbumDetailBlocEvent event,
      Emitter<AlbumDetailBlocState> emit) async {
    try {
      final albumDetail = await repository.getDetailAlbums(event.id);
      if (albumDetail.isEmpty) {
        emit(const AlbumDetailBlocState.empty());
      } else {
        emit(AlbumDetailBlocState.loaded(albumDetailList: albumDetail));
        _logger.info('Emitted album detail state');
      }
    } catch (error, stackTrace) {
      _logger.severe('Fetch error  $error, stack trace: $stackTrace');
      emit(const AlbumDetailBlocState.error());
    }
  }
}

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/repositories/index.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:logging/logging.dart';

class DetailMusicPageBloc
    extends Bloc<DetailMusicPageEvent, DetailMusicPageState> {
  final SongDetailRepo repository;
  final Logger _logger = getLogger('DetailMusicPageBloc');
  DetailMusicPageBloc(this.repository)
      : super(const DetailMusicPageState.loading()) {
    on<FetchSongDetailEvent>(_fetchSongDetail);
  }

  void _fetchSongDetail(
      FetchSongDetailEvent event, Emitter<DetailMusicPageState> emit) async {
    try {
      final songDetail = await repository.getDetailSongInfo(event.id);
      if (songDetail == null) {
        emit(const DetailMusicPageState.loading());
        return;
      } else {
        emit(DetailMusicPageState.loaded(songDetail: songDetail));
      }
    } catch (error, stackTrace) {
      _logger
          .severe('Error getting song info: $error, stack trace: $stackTrace');
      emit(const DetailMusicPageState.error());
    }
  }
}

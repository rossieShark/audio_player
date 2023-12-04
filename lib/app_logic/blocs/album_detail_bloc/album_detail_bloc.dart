import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/repositories/index.dart';

class AlbumDetailBloc extends Bloc<AlbumDetailBlocEvent, AlbumDetailBlocState> {
  final AlbumDetailsRepository repository;

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
        print('Emitted album detail state');
      }
    } catch (error) {
      print('Error fetching album detail: $error');
    }
  }
}

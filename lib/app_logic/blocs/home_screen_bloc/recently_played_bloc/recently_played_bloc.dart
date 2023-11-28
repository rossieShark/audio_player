import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/services/services.dart';

class RecentlyPlayedBloc
    extends Bloc<RecentlyPlayedBlocEvent, RecentlyPlayedBlocState> {
  final RecentlyPlayedRepository repository;

  RecentlyPlayedBloc(this.repository)
      : super(const RecentlyPlayedBlocState.loading()) {
    on<FetchRecentlyPlayedEvent>(_fetchRecentlyPlayed);
  }

  void _fetchRecentlyPlayed(FetchRecentlyPlayedEvent event,
      Emitter<RecentlyPlayedBlocState> emit) async {
    try {
      final recentlyPlayedtList = await _returnSongs();
      if (recentlyPlayedtList.isEmpty) {
        emit(const RecentlyPlayedBlocState.loading());
      } else {
        emit(RecentlyPlayedBlocState.loaded(data: recentlyPlayedtList));
      }
    } catch (error) {
      emit(const RecentlyPlayedBlocState.error());
      print('Error fetching song detail: $error');
    }
  }

  Future<List<RecentlyPlayedSong>> _returnSongs() async {
    final recentlyPlayedtList = await repository.getTracksFromDb();
    if (recentlyPlayedtList.isEmpty) {
      return await repository.getTracks();
    } else {
      return recentlyPlayedtList;
    }
  }
}

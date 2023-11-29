import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/services/services.dart';

class RecentlyPlayedBloc
    extends Bloc<RecentlyPlayedBlocEvent, RecentlyPlayedState> {
  final RecentlyPlayedRepository repository;

  RecentlyPlayedBloc(this.repository)
      : super(const RecentlyPlayedState.loading()) {
    on<FetchRecentlyPlayedEvent>(_fetchRecentlyPlayed);
  }

  void _fetchRecentlyPlayed(
      FetchRecentlyPlayedEvent event, Emitter<RecentlyPlayedState> emit) async {
    try {
      final recentlyPlayedtList = await _returnSongs();
      if (recentlyPlayedtList.isEmpty) {
        emit(const RecentlyPlayedState.loading());
      } else {
        emit(RecentlyPlayedState.loaded(data: recentlyPlayedtList));
      }
    } catch (error) {
      emit(const RecentlyPlayedState.error());
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

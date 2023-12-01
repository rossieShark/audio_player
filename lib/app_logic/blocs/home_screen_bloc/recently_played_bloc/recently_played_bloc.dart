import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/repositories/home_screen_repositories/recently_played_repo.dart';

class RecentlyPlayedBloc
    extends Bloc<RecentlyPlayedBlocEvent, RecentlyPlayedState> {
  final RecentlyPlayedRepository _repository;

  RecentlyPlayedBloc(this._repository)
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
    final recentlyPlayedtList = await _repository.getTracks();
    return recentlyPlayedtList;
  }
}

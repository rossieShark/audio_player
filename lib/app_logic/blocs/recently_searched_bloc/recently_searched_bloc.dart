import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';
import 'package:audio_player/domain/repositories/recently_searched_repository/recently_searched_repository.dart';

class RecentlySearchedBloc
    extends Bloc<RecentlySearchedEvent, RecentlySearchedState> {
  final RecentlySearchedRepository _repository;

  RecentlySearchedBloc(this._repository)
      : super(const RecentlySearchedState.loading()) {
    on<AddToRecentlySearchedEvent>(_onAddRecentlySearched);
    on<LoadRecentlySearchedEvent>(_onLoadRecentlySearched);
    on<RemoveFromRecentlySearchedEvent>(_onRemoveRecentlySearched);
    on<RemoveAllEvent>(_onRemoveAllRecentlySearched);
  }

  void _onAddRecentlySearched(AddToRecentlySearchedEvent event,
      Emitter<RecentlySearchedState> emit) async {
    final recentlySearched =
        await _repository.addToRecentlySearched(event.songModel);
    emit(RecentlySearchedState.loaded(data: recentlySearched));
  }

  void _onLoadRecentlySearched(LoadRecentlySearchedEvent event,
      Emitter<RecentlySearchedState> emit) async {
    List<SongModel> recentlySearched = await _repository.loadFromDatabase();
    if (recentlySearched.isEmpty) {
      emit(const RecentlySearchedState.empty());
    } else {
      emit(RecentlySearchedState.loaded(data: recentlySearched));
    }
  }

  void _onRemoveRecentlySearched(RemoveFromRecentlySearchedEvent event,
      Emitter<RecentlySearchedState> emit) async {
    final recentlySearched =
        await _repository.removeFromRecentlySearched(event.song);
    if (recentlySearched.isEmpty) {
      emit(const RecentlySearchedState.empty());
    } else {
      emit(RecentlySearchedState.loaded(data: recentlySearched));
    }
  }

  void _onRemoveAllRecentlySearched(
      RemoveAllEvent event, Emitter<RecentlySearchedState> emit) async {
    await _repository.removeAllRecentlySearched();
    emit(const RecentlySearchedState.empty());
  }
}

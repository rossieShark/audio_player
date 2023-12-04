import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';
import 'package:audio_player/domain/services/database_service/database_service.dart';

class RecentlySearchedBloc
    extends Bloc<RecentlySearchedEvent, RecentlySearchedState> {
  final DatabaseService _databaseService;

  RecentlySearchedBloc(this._databaseService)
      : super(const RecentlySearchedState.loading()) {
    on<AddToRecentlySearchedEvent>(_onAddRecentlySearched);
    on<LoadRecentlySearchedEvent>(_onLoadRecentlySearched);
    on<RemoveFromRecentlySearchedEvent>(_onRemoveRecentlySearched);
    on<RemoveAllEvent>(_onRemoveAllRecentlySearched);
  }

  void _onAddRecentlySearched(AddToRecentlySearchedEvent event,
      Emitter<RecentlySearchedState> emit) async {
    List<SongModel> recentlySearched = await _loadFromDatabase();

    bool isUnique =
        recentlySearched.every((song) => song.id != event.songModel.id);

    if (isUnique) {
      recentlySearched.add(event.songModel);
      await _databaseService.addToRecentlySearched(event.songModel);
    }

    emit(RecentlySearchedState.loaded(data: recentlySearched));
  }

  void _onLoadRecentlySearched(LoadRecentlySearchedEvent event,
      Emitter<RecentlySearchedState> emit) async {
    List<SongModel> recentlySearched = await _loadFromDatabase();
    if (recentlySearched.isEmpty) {
      emit(const RecentlySearchedState.empty());
    } else {
      emit(RecentlySearchedState.loaded(data: recentlySearched));
    }
  }

  void _onRemoveRecentlySearched(RemoveFromRecentlySearchedEvent event,
      Emitter<RecentlySearchedState> emit) async {
    List<SongModel> recentlySearched = await _loadFromDatabase();
    recentlySearched.removeWhere((item) => item.id == event.song.id);
    await _databaseService.removeFromRecentlySearched(event.song);
    if (recentlySearched.isEmpty) {
      emit(const RecentlySearchedState.empty());
    } else {
      emit(RecentlySearchedState.loaded(data: recentlySearched));
    }
  }

  void _onRemoveAllRecentlySearched(
      RemoveAllEvent event, Emitter<RecentlySearchedState> emit) async {
    List<SongModel> recentlySearched = await _loadFromDatabase();
    recentlySearched.clear();
    await _databaseService.removeAllRecentlySearched();
    emit(const RecentlySearchedState.empty());
  }

  Future<List<SongModel>> _loadFromDatabase() async {
    return await _databaseService.loadRecentlySearched();
  }
}

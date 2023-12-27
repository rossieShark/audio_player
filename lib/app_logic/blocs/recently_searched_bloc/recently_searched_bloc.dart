import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';
import 'package:audio_player/domain/repositories/recently_searched_repository/recently_searched_repository.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@injectable
class RecentlySearchedBloc
    extends Bloc<RecentlySearchedEvent, RecentlySearchedState> {
  final RecentlySearchedRepo _repository;
  final Logger _logger = getLogger('RecentlySearchedBloc');
  RecentlySearchedBloc(this._repository)
      : super(const RecentlySearchedState.loading()) {
    on<AddToRecentlySearchedEvent>(_onAddRecentlySearched);
    on<LoadRecentlySearchedEvent>(_onLoadRecentlySearched);
    on<RemoveFromRecentlySearchedEvent>(_onRemoveRecentlySearched);
    on<RemoveAllEvent>(_onRemoveAllRecentlySearched);
  }

  void _onAddRecentlySearched(AddToRecentlySearchedEvent event,
      Emitter<RecentlySearchedState> emit) async {
    try {
      final recentlySearched =
          await _repository.addToRecentlySearched(event.songModel);
      emit(RecentlySearchedState.loaded(data: recentlySearched));
    } catch (error, stackTrace) {
      _logger.severe(
          'Add to recentlySearched error:$error, stack trace: $stackTrace');
    }
  }

  void _onLoadRecentlySearched(LoadRecentlySearchedEvent event,
      Emitter<RecentlySearchedState> emit) async {
    try {
      List<SongModel> recentlySearched = await _repository.loadFromDatabase();
      if (recentlySearched.isEmpty) {
        emit(const RecentlySearchedState.empty());
      } else {
        emit(RecentlySearchedState.loaded(data: recentlySearched));
      }
    } catch (error, stackTrace) {
      _logger.severe(
          'Load recentlySearched error:$error, stack trace: $stackTrace');
    }
  }

  void _onRemoveRecentlySearched(RemoveFromRecentlySearchedEvent event,
      Emitter<RecentlySearchedState> emit) async {
    try {
      final recentlySearched =
          await _repository.removeFromRecentlySearched(event.song);
      if (recentlySearched.isEmpty) {
        emit(const RecentlySearchedState.empty());
      } else {
        emit(RecentlySearchedState.loaded(data: recentlySearched));
      }
    } catch (error, stackTrace) {
      _logger.severe(
          'Remove recentlySearched error: $error, stack trace: $stackTrace');
    }
  }

  void _onRemoveAllRecentlySearched(
      RemoveAllEvent event, Emitter<RecentlySearchedState> emit) async {
    try {
      await _repository.removeAllRecentlySearched();
      emit(const RecentlySearchedState.empty());
    } catch (error, stackTrace) {
      _logger.severe(
          'Remove all recentlySearched error: $error, stack trace: $stackTrace');
    }
  }
}

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/favorite_folder_model.dart';
import 'package:audio_player/domain/repositories/new_playlist_repository/new_playlist_repository.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@injectable
class NewPlaylistBloc extends Bloc<NewPlaylistBlocEvent, NewPlaylistState> {
  final NewPlaylistRepo _repository;
  final Logger _logger = getLogger('NewPlaylistBloc');
  NewPlaylistBloc(this._repository) : super(const NewPlaylistState.empty()) {
    on<AddNewPlaylistEvent>(_onAddPlaylist);
    on<LoadNewPlaylistEvent>(_onLoadPlaylist);
  }

  void _onAddPlaylist(
      AddNewPlaylistEvent event, Emitter<NewPlaylistState> emit) async {
    try {
      final folders = await _repository.addToFolders(event.folderName);
      emit(NewPlaylistState.loaded(folders: folders));
    } catch (error, stackTrace) {
      _logger.severe('Add playlist error: $error, stack trace: $stackTrace');
    }
  }

  void _onLoadPlaylist(
      LoadNewPlaylistEvent event, Emitter<NewPlaylistState> emit) async {
    try {
      List<FavoriteFolder> folders = await _repository.loadPlaylists();
      if (folders.isEmpty) {
        emit(const NewPlaylistState.empty());
      } else {
        emit(NewPlaylistState.loaded(folders: folders));
      }
    } catch (error, stackTrace) {
      _logger.severe('Load playlist error: $error, stack trace: $stackTrace');
    }
  }
}

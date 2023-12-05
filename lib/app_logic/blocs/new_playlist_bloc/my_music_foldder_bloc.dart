import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/favorite_folder_model.dart';
import 'package:audio_player/domain/repositories/new_playlist_repository/new_playlist_repository.dart';

class NewPlaylistBloc extends Bloc<NewPlaylistBlocEvent, NewPlaylistState> {
  final NewPlaylistRepository _repository;

  NewPlaylistBloc(this._repository) : super(const NewPlaylistState.empty()) {
    on<AddNewPlaylistEvent>(_onAddFolder);

    on<LoadNewPlaylistEvent>(_onLoadFolders);
  }

  void _onAddFolder(
      AddNewPlaylistEvent event, Emitter<NewPlaylistState> emit) async {
    List<FavoriteFolder> folders = await _returnMyFolderList();
    final folder = _repository.convertToFavoriteFolder(event.folderName);
    folders.add(folder);
    await _repository.addToFolders(folder);

    emit(NewPlaylistState.loaded(folders: folders));
  }

  void _onLoadFolders(
      LoadNewPlaylistEvent event, Emitter<NewPlaylistState> emit) async {
    List<FavoriteFolder> folders = await _returnMyFolderList();
    if (folders.isEmpty) {
      emit(const NewPlaylistState.empty());
    } else {
      emit(NewPlaylistState.loaded(folders: folders));
    }
  }

  Future<List<FavoriteFolder>> _returnMyFolderList() async {
    return await _repository.returnMyMusicFolderList();
  }
}

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/favorite_folder_model.dart';
import 'package:audio_player/domain/services/database_service/database_service.dart';
import 'package:audio_player/resources/resources.dart';

class MyMusicFolderBlocBloc extends Bloc<MyMusicBlocEvent, MyMusicFolderState> {
  final DatabaseService _databaseService;

  MyMusicFolderBlocBloc(
    this._databaseService,
  ) : super(const MyMusicFolderState.empty()) {
    on<AddFolderEvent>(_onAddFolder);

    on<LoadMyMusicFoldersEvent>(_onLoadFolders);
  }

  void _onAddFolder(
      AddFolderEvent event, Emitter<MyMusicFolderState> emit) async {
    List<FavoriteFolder> folders = await _returnMyFolderList();
    final folder =
        FavoriteFolder(image: AppImages.playlist, title: event.folderName);
    folders.add(folder);
    await _databaseService.addToFolders(folder);

    emit(MyMusicFolderState.loaded(folders: folders));
  }

  void _onLoadFolders(
      LoadMyMusicFoldersEvent event, Emitter<MyMusicFolderState> emit) async {
    List<FavoriteFolder> folders = await _returnMyFolderList();
    if (folders.isEmpty) {
      emit(const MyMusicFolderState.empty());
    } else {
      emit(MyMusicFolderState.loaded(folders: folders));
    }
  }

  Future<List<FavoriteFolder>> _returnMyFolderList() async {
    return await _databaseService.returnMyMusicFolderList();
  }
}

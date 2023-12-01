import 'package:audio_player/domain/entity/favorite_folder_model.dart';
import 'package:equatable/equatable.dart';

abstract class MyMusicBlocEvent extends Equatable {
  const MyMusicBlocEvent();
}

class LoadMyMusicFoldersEvent extends MyMusicBlocEvent {
  const LoadMyMusicFoldersEvent();

  @override
  List<Object?> get props => [];
}

class AddFolderEvent extends MyMusicBlocEvent {
  final String folderName;
  const AddFolderEvent(this.folderName);

  @override
  List<Object> get props => [folderName];
}

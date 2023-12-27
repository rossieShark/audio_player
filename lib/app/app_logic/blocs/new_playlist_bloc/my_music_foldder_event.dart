import 'package:equatable/equatable.dart';

abstract class NewPlaylistBlocEvent extends Equatable {
  const NewPlaylistBlocEvent();
}

class LoadNewPlaylistEvent extends NewPlaylistBlocEvent {
  const LoadNewPlaylistEvent();

  @override
  List<Object?> get props => [];
}

class AddNewPlaylistEvent extends NewPlaylistBlocEvent {
  final String folderName;
  const AddNewPlaylistEvent(this.folderName);

  @override
  List<Object> get props => [folderName];
}

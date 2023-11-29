import 'package:audio_player/domain/entity/favorite_folder_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_music_foldder_state.freezed.dart';
// part 'my_music_foldder_state.g.dart';

@Freezed(equal: false)
class MyMusicFolderState with _$MyMusicFolderState {
  const factory MyMusicFolderState.empty() = EmptyMyMusicFolderState;
  const factory MyMusicFolderState.loaded(
      {required List<FavoriteFolder> folders}) = LoadedMyMusicFolderState;

  // factory MyMusicFolderState.fromJson(Map<String, Object?> json) =>
  //     _$MyMusicFolderStateFromJson(json);
}

import 'package:audio_player/domain/entity/favorite_folder_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_music_foldder_state.freezed.dart';
// part 'my_music_foldder_state.g.dart';

@Freezed(equal: false)
class NewPlaylistState with _$NewPlaylistState {
  const factory NewPlaylistState.empty() = EmptyNewPlaylistState;
  const factory NewPlaylistState.loaded(
      {required List<FavoriteFolder> folders}) = LoadedNewPlaylistState;

  // factory MyMusicFolderState.fromJson(Map<String, Object?> json) =>
  //     _$MyMusicFolderStateFromJson(json);
}

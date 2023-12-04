import 'package:audio_player/databases/app_database/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'album_bloc_state.freezed.dart';
//part 'album_bloc_state.g.dart';

@Freezed(equal: false)
class AlbumBlocState with _$AlbumBlocState {
  const factory AlbumBlocState.error() = ErrorAlbumBlocState;
  const factory AlbumBlocState.loading() = LoadingAlbumBlocState;
  const factory AlbumBlocState.loaded({required List<BestAlbum> data}) =
      LoadedAlbumBlocState;
  // factory AlbumBlocState.fromJson(Map<String, Object?> json) =>
  //     _$AlbumBlocStateFromJson(json);
}

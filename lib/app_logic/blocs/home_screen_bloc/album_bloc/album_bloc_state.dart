import 'package:audio_player/databases/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'album_bloc_state.freezed.dart';
part 'album_bloc_state.g.dart';

@Freezed(equal: false)
class AlbumState with _$AlbumState {
  const factory AlbumState.error() = ErrorAlbumState;
  const factory AlbumState.loading() = LoadingAlbumState;
  const factory AlbumState.loaded({required List<BestAlbum> data}) =
      LoadedAlbumState;
  factory AlbumState.fromJson(Map<String, Object?> json) =>
      _$AlbumStateFromJson(json);
}

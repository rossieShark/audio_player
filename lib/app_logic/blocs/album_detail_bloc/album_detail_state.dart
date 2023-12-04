import 'package:audio_player/databases/app_database/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'album_detail_state.freezed.dart';
//part 'album_detail_state.g.dart';

@Freezed(equal: false)
class AlbumDetailBlocState with _$AlbumDetailBlocState {
  const factory AlbumDetailBlocState.empty() = EmptyAlbumDetailBlocState;
  const factory AlbumDetailBlocState.loading() = LoadingAlbumDetailBlocState;
  const factory AlbumDetailBlocState.loaded(
          {required List<DetailAlbum> albumDetailList}) =
      LoadedAlbumDetailBlocState;
  // factory AlbumDetailBlocState.fromJson(Map<String, Object?> json) =>
  //     _$AlbumDetailBlocStateFromJson(json);
}

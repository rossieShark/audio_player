import 'package:audio_player/databases/app_database/database.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'favourite_artist_state.freezed.dart';
//part 'favourite_artist_state.g.dart';

@Freezed(equal: false)
class FavoriteArtistBlocState with _$FavoriteArtistBlocState {
  const factory FavoriteArtistBlocState.error() = ErrorFavoriteArtistBlocState;
  const factory FavoriteArtistBlocState.loading() =
      LoadingFavoriteArtistBlocState;
  const factory FavoriteArtistBlocState.loaded(
      {required List<FavoriteArtist> data}) = LoadedFavoriteArtistBlocState;
  // factory FavoriteArtistBlocState.fromJson(Map<String, Object?> json) =>
  //     _$FavoriteArtistBlocStateFromJson(json);
}

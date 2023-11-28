import 'package:audio_player/databases/database.dart';

// class FavoriteArtistState {
//   final List<FavoriteArtist> favoriteArtistList;

//   FavoriteArtistState(this.favoriteArtistList);
// }

import 'package:freezed_annotation/freezed_annotation.dart';
part 'favourite_artist_state.freezed.dart';
part 'favourite_artist_state.g.dart';

@Freezed(equal: false)
class FavoriteArtistState with _$FavoriteArtistState {
  const factory FavoriteArtistState.error() = ErrorFavoriteArtistState;
  const factory FavoriteArtistState.loading() = LoadingFavoriteArtistState;
  const factory FavoriteArtistState.loaded(
      {required List<FavoriteArtist> data}) = LoadedFavoriteArtistState;
  factory FavoriteArtistState.fromJson(Map<String, Object?> json) =>
      _$FavoriteArtistStateFromJson(json);
}

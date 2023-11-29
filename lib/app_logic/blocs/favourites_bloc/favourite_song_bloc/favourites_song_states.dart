import 'package:audio_player/domain/entity/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourites_song_states.freezed.dart';
// part 'favourites_song_states.g.dart';

@Freezed(equal: false)
class FavouriteSongState with _$FavouriteSongState {
  const factory FavouriteSongState.loading() = LoadingFavouriteSongState;
  const factory FavouriteSongState.noResults() = NoResultsFavouriteSongState;
  const factory FavouriteSongState.loaded({required List<SongModel> data}) =
      LoadedFavouriteSongState;

  // factory FavouriteSongState.fromJson(Map<String, Object?> json) =>
  //     _$FavouriteSongStateFromJson(json);
}
// import 'package:audio_player/domain/entity/models.dart';


// class FavoriteSongState {
//   final List<SongModel> data;

//   const FavoriteSongState({
//     required this.data,
//   });
// }


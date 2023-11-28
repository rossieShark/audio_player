import 'package:audio_player/databases/database.dart';

// class GenresState {
//   final List<MusicGenre> genres;

//   GenresState(this.genres);
// }
import 'package:audio_player/domain/entity/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'genres_state.freezed.dart';
part 'genres_state.g.dart';

@Freezed(equal: false)
class GenresState with _$GenresState {
  const factory GenresState.error() = ErrorGenresState;
  const factory GenresState.loading() = LoadingGenresState;
  const factory GenresState.loaded({required List<MusicGenre> data}) =
      LoadedGenresState;
  factory GenresState.fromJson(Map<String, Object?> json) =>
      _$GenresStateFromJson(json);
}

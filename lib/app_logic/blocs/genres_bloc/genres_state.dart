import 'package:audio_player/databases/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'genres_state.freezed.dart';
part 'genres_state.g.dart';

@Freezed(equal: false)
class GenresBlocState with _$GenresBlocState {
  const factory GenresBlocState.error() = ErrorGenresBlocState;
  const factory GenresBlocState.loading() = LoadingGenresBlocState;
  const factory GenresBlocState.loaded({required List<MusicGenre> data}) =
      LoadedGenresBlocState;
  factory GenresBlocState.fromJson(Map<String, Object?> json) =>
      _$GenresBlocStateFromJson(json);
}

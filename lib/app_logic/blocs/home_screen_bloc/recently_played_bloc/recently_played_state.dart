import 'package:audio_player/databases/database.dart';

// class RecentlyPlayedBlocState {
//   final List<RecentlyPlayedSong> recentlyPlayedtList;

//   RecentlyPlayedBlocState(this.recentlyPlayedtList);
// }

import 'package:freezed_annotation/freezed_annotation.dart';
part 'recently_played_state.freezed.dart';
part 'recently_played_state.g.dart';

@Freezed(equal: false)
class RecentlyPlayedBlocState with _$RecentlyPlayedBlocState {
  const factory RecentlyPlayedBlocState.error() = ErrorRecentlyPlayedBlocState;
  const factory RecentlyPlayedBlocState.loading() =
      LoadingRecentlyPlayedBlocState;
  const factory RecentlyPlayedBlocState.loaded(
      {required List<RecentlyPlayedSong> data}) = LoadedRecentlyPlayedBlocState;
  factory RecentlyPlayedBlocState.fromJson(Map<String, Object?> json) =>
      _$RecentlyPlayedBlocStateFromJson(json);
}

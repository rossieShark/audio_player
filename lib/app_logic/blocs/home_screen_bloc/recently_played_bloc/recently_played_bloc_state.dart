import 'package:audio_player/databases/database.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'recently_played_bloc_state.freezed.dart';
part 'recently_played_bloc_state.g.dart';

@Freezed(equal: false)
class RecentlyPlayedState with _$RecentlyPlayedState {
  const factory RecentlyPlayedState.error() = ErrorRecentlyPlayedState;
  const factory RecentlyPlayedState.loading() = LoadingRecentlyPlayedState;
  const factory RecentlyPlayedState.loaded(
      {required List<RecentlyPlayedSong> data}) = LoadedRecentlyPlayedState;
  factory RecentlyPlayedState.fromJson(Map<String, Object?> json) =>
      _$RecentlyPlayedStateFromJson(json);
}

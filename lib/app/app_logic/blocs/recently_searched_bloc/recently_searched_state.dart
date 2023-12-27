import 'package:audio_player/app/domain/entity/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recently_searched_state.freezed.dart';

@Freezed()
class RecentlySearchedState with _$RecentlySearchedState {
  const factory RecentlySearchedState.loading() = LoadingRecentlySearchedState;
  const factory RecentlySearchedState.empty() = EmptyRecentlySearchedState;
  const factory RecentlySearchedState.loaded({required List<SongModel> data}) =
      LoadedRecentlySearchedState;
//  factory RecentlySearchedState.fromJson(Map<String, Object?> json) =>
//       _$RecentlySearchedStateFromJson(json);
}

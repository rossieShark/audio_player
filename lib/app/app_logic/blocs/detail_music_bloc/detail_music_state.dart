import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail_music_state.freezed.dart';

@Freezed(equal: false)
class DetailMusicPageState with _$DetailMusicPageState {
  const factory DetailMusicPageState.loading() = LoadingDetailMusicPageState;
  const factory DetailMusicPageState.error() = ErrorDetailMusicPageState;
  const factory DetailMusicPageState.loaded(
      {required DetailInfoSong? songDetail}) = LoadedDetailMusicPageState;
}

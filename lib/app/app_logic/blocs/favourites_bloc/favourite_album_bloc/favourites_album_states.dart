import 'package:audio_player/app/domain/entity/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourites_album_states.freezed.dart';

@Freezed()
class FavoriteAlbumState with _$FavoriteAlbumState {
  const factory FavoriteAlbumState.loading() = LoadingFavoriteAlbumState;
  const factory FavoriteAlbumState.noResults() = NoResultsFavoriteAlbumState;
  const factory FavoriteAlbumState.loaded({required List<SongModel> data}) =
      LoadedFavoriteAlbumState;
}

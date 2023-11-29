import 'package:audio_player/domain/entity/models.dart';

abstract class FavoriteAlbumEvent {}

class ToggleFavoriteAlbumEvent extends FavoriteAlbumEvent {
  final SongModel songModel;

  ToggleFavoriteAlbumEvent(this.songModel);
}

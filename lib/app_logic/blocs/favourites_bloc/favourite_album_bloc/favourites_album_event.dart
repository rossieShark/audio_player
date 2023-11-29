import 'package:audio_player/domain/entity/models.dart';
import 'package:equatable/equatable.dart';

abstract class FavoriteAlbumEvent extends Equatable {
  const FavoriteAlbumEvent();
}

class LoadFavoriteAlbumEvent extends FavoriteAlbumEvent {
  const LoadFavoriteAlbumEvent();
  @override
  List<Object?> get props => [];
}

class AddAlbumEvent extends FavoriteAlbumEvent {
  final SongModel albums;
  const AddAlbumEvent(this.albums);

  @override
  List<Object> get props => [albums];
}

class RemoveAlbumsEvent extends FavoriteAlbumEvent {
  final SongModel album;
  const RemoveAlbumsEvent(this.album);

  @override
  List<Object> get props => [album];
}

class SortAlbumsEvent extends FavoriteAlbumEvent {
  const SortAlbumsEvent();

  @override
  List<Object> get props => [];
}

class IsFavouriteAlbumEvent extends FavoriteAlbumEvent {
  final String albumId;
  const IsFavouriteAlbumEvent({required this.albumId});

  @override
  List<Object> get props => [albumId];
}

class ToggleIsFavouriteAlbum extends FavoriteAlbumEvent {
  final SongModel album;
  const ToggleIsFavouriteAlbum({
    required this.album,
  });
  @override
  List<Object?> get props => [album];
}

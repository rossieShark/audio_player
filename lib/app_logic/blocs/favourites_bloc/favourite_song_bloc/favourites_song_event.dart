// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:audio_player/domain/entity/models.dart';

abstract class FavoriteSongEvent extends Equatable {
  const FavoriteSongEvent();
}

class LoadFavouriteSongsEvent extends FavoriteSongEvent {
  const LoadFavouriteSongsEvent();

  @override
  List<Object?> get props => [];
}

class AddSongsEvent extends FavoriteSongEvent {
  final SongModel song;
  const AddSongsEvent(this.song);

  @override
  List<Object> get props => [song];
}

class RemoveSongsEvent extends FavoriteSongEvent {
  final SongModel detailSong;
  const RemoveSongsEvent(this.detailSong);

  @override
  List<Object> get props => [detailSong];
}

class SortSongsEvent extends FavoriteSongEvent {
  const SortSongsEvent();

  @override
  List<Object> get props => [];
}

class IsFavouriteSongEvent extends FavoriteSongEvent {
  final String songId;
  const IsFavouriteSongEvent({required this.songId});

  @override
  List<Object> get props => [songId];
}

class ToggleIsFavourite extends FavoriteSongEvent {
  final SongModel detailSong;
  const ToggleIsFavourite({
    required this.detailSong,
  });
  @override
  List<Object?> get props => [detailSong];
}

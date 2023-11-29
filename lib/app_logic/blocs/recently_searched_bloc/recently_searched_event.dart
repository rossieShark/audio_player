import 'package:audio_player/domain/entity/models.dart';
import 'package:equatable/equatable.dart';

abstract class RecentlySearchedEvent extends Equatable {
  const RecentlySearchedEvent();
}

class LoadRecentlySearchedEvent extends RecentlySearchedEvent {
  const LoadRecentlySearchedEvent();
  @override
  List<Object?> get props => [];
}

class AddToRecentlySearchedEvent extends RecentlySearchedEvent {
  final SongModel songModel;

  const AddToRecentlySearchedEvent(this.songModel);

  @override
  // TODO: implement props
  List<Object?> get props => [songModel];
}

class RemoveFromRecentlySearchedEvent extends RecentlySearchedEvent {
  final SongModel song;
  const RemoveFromRecentlySearchedEvent(this.song);

  @override
  List<Object> get props => [song];
}

class RemoveAllEvent extends RecentlySearchedEvent {
  const RemoveAllEvent();

  @override
  List<Object> get props => [];
}

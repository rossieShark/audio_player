import 'package:audio_player/domain/entity/models.dart';

abstract class RecentlySearchedEvent {}

class AddToRecentlySearchedEvent extends RecentlySearchedEvent {
  final SongModel songModel;

  AddToRecentlySearchedEvent(this.songModel);
}

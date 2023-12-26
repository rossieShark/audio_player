import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:logging/logging.dart';

abstract class RecentlySearchedRepo {
  Future<List<SongModel>> loadFromDatabase();
  Future<List<SongModel>> addToRecentlySearched(SongModel detailSong);
  Future<List<SongModel>> removeFromRecentlySearched(SongModel detailSong);
  Future<void> removeAllRecentlySearched();
}

class RecentlySearchedRepository implements RecentlySearchedRepo {
  final AudioAppDatabase _database;

  RecentlySearchedRepository(this._database);
  final Logger _logger = getLogger('RecentlySearchedRepository');
  @override
  Future<List<SongModel>> loadFromDatabase() async {
    try {
      final recentlySearchedSongs = await _database.getRecentlySearchedSongs();
      final loadedRecentlySearchedSongs = recentlySearchedSongs
          .map(
            (favoriteSong) => SongModel(
              preview: favoriteSong.preview,
              type: favoriteSong.type,
              id: favoriteSong.id.toString(),
              title: favoriteSong.title,
              artistNames: favoriteSong.artist,
              image: favoriteSong.songImage,
              isFavourite: favoriteSong.isFavourite,
            ),
          )
          .toList();
      return loadedRecentlySearchedSongs;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error loading recently searched songs: $error, stack trace: $stackTrace');
      return [];
    }
  }

  @override
  Future<List<SongModel>> addToRecentlySearched(SongModel detailSong) async {
    try {
      bool isUniqueSong = await isUnique(detailSong.id);
      if (isUniqueSong) {
        await _database.insertRecentlySearched(
          RecentlySearchedSong(
            preview: detailSong.preview,
            type: detailSong.type,
            id: int.parse(detailSong.id),
            title: detailSong.title,
            artist: detailSong.artistNames,
            songImage: detailSong.image,
            isFavourite: detailSong.isFavourite,
          ),
        );
      }
      return await loadFromDatabase();
    } catch (error, stackTrace) {
      _logger.severe(
          'Error adding to recently searched songs: $error, stack trace: $stackTrace');
      return [];
    }
  }

  @override
  Future<List<SongModel>> removeFromRecentlySearched(
      SongModel detailSong) async {
    try {
      await _database.deleteRecentlySearched(int.parse(detailSong.id));
      return await loadFromDatabase();
    } catch (error, stackTrace) {
      _logger.severe(
          'Error removing from recently searched songs: $error, stack trace: $stackTrace');
      return [];
    }
  }

  Future<bool> isUnique(String id) async {
    try {
      final recentlySearched = await loadFromDatabase();
      return recentlySearched.every((song) => song.id != id);
    } catch (error, stackTrace) {
      _logger.severe(
          'Error checking uniqueness: $error, stack trace: $stackTrace');
      return false;
    }
  }

  @override
  Future<void> removeAllRecentlySearched() async {
    try {
      await _database.clearAll();
    } catch (error, stackTrace) {
      _logger.severe(
          'Error clearing all recently searched songs: $error, stack trace: $stackTrace');
    }
  }
}

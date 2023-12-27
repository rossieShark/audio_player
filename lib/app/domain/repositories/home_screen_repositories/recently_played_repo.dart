import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/domain/entity/recently_played_model/recently_played_model.dart';
import 'package:audio_player/app/domain/services/logger.dart';
import 'package:audio_player/app/domain/services/services.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

abstract class RecentlyPlayedRepo {
  Future<List<RecentlyPlayedSong>> getTracks();
}

@Injectable(as: RecentlyPlayedRepo)
class RecentlyPlayedRepository implements RecentlyPlayedRepo {
  final AudioAppDatabase _database;
  final AudioPlayerService _recentlyPlayedService;

  RecentlyPlayedRepository(this._database, this._recentlyPlayedService);
  final Logger _logger = getLogger('RecentlyPlayedRepository');

  /// Caches tracks into the database and returns the cached recently played songs.
  Future<List<RecentlyPlayedSong>> _cacheTracks(List<TracksData> tracks) async {
    try {
      final songsToInsert = tracks.map((track) {
        return RecentlyPlayedSong(
          type: track.type,
          artistNames: track.artist.name,
          title: track.title,
          headerImageUrl: track.artist.image,
          preview: track.preview,
          id: track.id,
        );
      }).toList();

      await _database.addManySongs(songsToInsert);
      return songsToInsert;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error caching recently played songs: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Gets all recently played songs from the database.
  Future<List<RecentlyPlayedSong>> _getTracksFromDb() async {
    try {
      return await _database.getallRecentlyPlayedSongs();
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting recently played songs from database: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Gets recently played songs, either from the database or the API if not cached.
  @override
  Future<List<RecentlyPlayedSong>> getTracks() async {
    try {
      final dbTracks = await _getTracksFromDb();

      if (dbTracks.isNotEmpty) {
        return dbTracks;
      }

      return await _cacheTracks(await _getTracksFromApi());
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting recently played songs: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Get recently played songs from the API.
  Future<List<TracksData>> _getTracksFromApi() async {
    try {
      final apiTracks = await _recentlyPlayedService.getRecentlyPlayedTracks();
      final apiTracksResponse = apiTracks.body?.tracks.data as List<TracksData>;
      return apiTracksResponse;
    } catch (error, stackTrace) {
      // Handle the error, e.g., log it or throw a custom exception.
      _logger.severe(
          'Error getting recently played songs from API: $error, stack trace: $stackTrace');
      return [];
    }
  }
}

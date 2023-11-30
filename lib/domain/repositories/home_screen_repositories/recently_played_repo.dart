import 'package:audio_player/databases/database.dart';
import 'package:audio_player/domain/entity/recently_played_model/recently_played_model.dart';
import 'package:audio_player/domain/services/services.dart';

class RecentlyPlayedRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService _recentlyPlayedService;

  RecentlyPlayedRepository(this._database, this._recentlyPlayedService);

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
    } catch (error) {
      print('Error caching recently played songs: $error');
      return [];
    }
  }

  /// Gets all recently played songs from the database.
  Future<List<RecentlyPlayedSong>> _getTracksFromDb() async {
    try {
      return await _database.getallRecentlyPlayedSongs();
    } catch (error) {
      print('Error getting recently played songs from database: $error');
      return [];
    }
  }

  /// Gets recently played songs, either from the database or the API if not cached.
  Future<List<RecentlyPlayedSong>> getTracks() async {
    try {
      final dbTracks = await _getTracksFromDb();

      if (dbTracks.isNotEmpty) {
        return dbTracks;
      }

      return await _cacheTracks(await _getTracksFromApi());
    } catch (error) {
      print('Error getting recently played songs: $error');
      return [];
    }
  }

  /// Get recently played songs from the API.
  Future<List<TracksData>> _getTracksFromApi() async {
    try {
      final apiTracks = await _recentlyPlayedService.getRecentlyPlayedTracks();
      final apiTracksResponse = apiTracks.body?.tracks.data as List<TracksData>;
      return apiTracksResponse;
    } catch (error) {
      // Handle the error, e.g., log it or throw a custom exception.
      print('Error getting recently played songs from API: $error');
      return [];
    }
  }
}

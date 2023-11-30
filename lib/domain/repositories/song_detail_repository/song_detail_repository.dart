import 'package:audio_player/databases/database.dart';
import 'package:audio_player/domain/entity/song_model/song_model.dart';
import 'package:audio_player/domain/services/api_service/service.dart';

class SongDetailRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService _songDetailsService;

  SongDetailRepository(this._database, this._songDetailsService);

  /// Gets detailed song information either from the local database or the API if not cached.
  Future<DetailInfoSong?> getDetailSongInfo(String id) async {
    try {
      final detailSong = await _getSongsFromDB(int.parse(id));

      if (detailSong == null) {
        await _getSongsFromAPI(id);
      }
      return detailSong;
    } catch (error) {
      print('Error getting detail song information: $error');
      return null;
    }
  }

  /// Caches the provided song details into the database and returns the cached details.
  Future<DetailInfoSong?> _cacheSongs(
      SongDetailsResponce? albumAppearances, String id) async {
    try {
      final detailSongToInsert = DetailInfoSong(
        type: albumAppearances?.type ?? 'track',
        id: int.parse(id),
        preview: albumAppearances?.preview ?? '',
        artistNames: albumAppearances?.contributors[0].name ?? '',
        title: albumAppearances?.title ?? '',
        imageUrl: albumAppearances?.contributors[0].image ?? '',
      );

      await _database.insertDetailSong(detailSongToInsert);

      return detailSongToInsert;
    } catch (error) {
      print('Error caching detail song information: $error');
      return null;
    }
  }

  /// Gets detailed song information from the local database.
  Future<DetailInfoSong?> _getSongsFromDB(int songId) async {
    try {
      return await _database.watchDetailSongById(songId).first;
    } catch (error) {
      print('Error getting detail song information from database: $error');
      return null;
    }
  }

  /// Gets detailed song information from the API and caches it into the database.
  Future<DetailInfoSong?> _getSongsFromAPI(String id) async {
    try {
      final apiResponse = await _songDetailsService.getDetailSongs(id);
      if (apiResponse.isSuccessful) {
        final albumAppearances = apiResponse.body;
        return await _cacheSongs(albumAppearances, id);
      } else {
        print('API request failed: ${apiResponse.error}');
        return null;
      }
    } catch (error) {
      print('Error getting detail song information from API: $error');
      return null;
    }
  }
}

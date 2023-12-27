import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:audio_player/domain/services/services.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

abstract class AlbumDetails {
  Future<List<DetailAlbum>> getDetailAlbums(String albumId);
}

@Injectable(as: AlbumDetails)
class AlbumDetailsRepository implements AlbumDetails {
  final AudioAppDatabase _database;
  final AudioPlayerService _albumDetailsService;

  AlbumDetailsRepository(this._database, this._albumDetailsService);
  final Logger _logger = getLogger('AlbumDetailsRepository');

  /// Gets detailed album information either from the local database or the API if not cached.
  @override
  Future<List<DetailAlbum>> getDetailAlbums(String albumId) async {
    try {
      final cachedAlbums = await _getAlbumsFromDb(albumId);

      if (cachedAlbums.isNotEmpty) {
        return cachedAlbums;
      } else {
        final albumAppearances = await _getAlbumsFromApi(albumId);
        return await _cacheAlbums(albumAppearances, albumId);
      }
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting detail album information: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Gets detailed album information from the local database.
  Future<List<DetailAlbum>> _getAlbumsFromDb(String albumId) async {
    try {
      return await _database.watchInfoInDetailAlbum(int.parse(albumId)).first;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting detail album information from database: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Caches the provided album details into the database and returns the cached details.
  Future<List<DetailAlbum>> _cacheAlbums(
      List<AlbumData> albumAppearances, String albumId) async {
    try {
      final detailAlbumsToInsert = albumAppearances.map((albumData) {
        return DetailAlbum(
          preview: albumData.preview,
          type: albumData.type,
          albumid: int.parse(albumId),
          artistNames: albumData.artist.name,
          title: albumData.title,
          id: int.parse(albumData.id.toString()),
        );
      }).toList();

      await _database.addManyDetailAlbums(detailAlbumsToInsert);

      return detailAlbumsToInsert;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error caching detail album information: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Gets detailed album information from the API.
  Future<List<AlbumData>> _getAlbumsFromApi(String albumId) async {
    try {
      final songsList = await _albumDetailsService.getAlbumSongsList(albumId);
      return songsList.body?.data as List<AlbumData>;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting detail album information from API:$error, stack trace: $stackTrace');
      return [];
    }
  }
}

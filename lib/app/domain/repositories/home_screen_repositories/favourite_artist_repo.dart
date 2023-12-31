import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/domain/entity/home_screen_data/favourite_artist_model/favourite_artist_model.dart';
import 'package:audio_player/app/domain/services/logger.dart';
import 'package:audio_player/app/domain/services/services.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

abstract class FavoriteArtistRepo {
  Future<List<FavoriteArtist>> getFavoriteArtists();
}

@Injectable(as: FavoriteArtistRepo)
class FavoriteArtistRepository implements FavoriteArtistRepo {
  final AudioAppDatabase _database;
  final AudioPlayerService _recentlyPlayedService;

  FavoriteArtistRepository(this._database, this._recentlyPlayedService);
  final Logger _logger = getLogger('FavoriteArtistRepository');

  /// Caches the artists into the database and returns the cached favorite artists.
  Future<List<FavoriteArtist>> _cacheArtists(List<Artists> artists) async {
    try {
      final artistsToInsert = artists.map((artist) {
        return FavoriteArtist(
          name: artist.name,
          id: artist.id,
          image: artist.image,
        );
      }).toList();

      await _database.addManyFavoriteArtists(artistsToInsert);
      return artistsToInsert;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error caching favorite artists: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Gets all favorite artists from the database.
  Future<List<FavoriteArtist>> _getArtistsFromDb() async {
    try {
      return await _database.getallFavouriteArtists();
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting favorite artists from database: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Gets favorite artists, either from the database or the API if not cached.
  @override
  Future<List<FavoriteArtist>> getFavoriteArtists() async {
    try {
      final dbArtists = await _getArtistsFromDb();
      if (dbArtists.isNotEmpty) {
        return dbArtists;
      }
      return await _cacheArtists(await _getFavoriteArtistsFromApi());
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting favorite artists: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Get favorite artists from the API.
  Future<List<Artists>> _getFavoriteArtistsFromApi() async {
    try {
      final apiArtists = await _recentlyPlayedService.getFavoriteArtists();
      final apiArtistsResponse = apiArtists.body?.data as List<Artists>;
      return apiArtistsResponse;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting favorite artists from API: $error, stack trace: $stackTrace');
      return [];
    }
  }
}

import 'package:audio_player/databases/database.dart';
import 'package:audio_player/domain/entity/home_screen_data/favourite_artist_model/favourite_artist_model.dart';
import 'package:audio_player/services/api_service/service.dart';

class FavoriteArtistRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService _recentlyPlayedService;

  FavoriteArtistRepository(this._database, this._recentlyPlayedService);

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
    } catch (error) {
      print('Error caching favorite artists: $error');
      return [];
    }
  }

  /// Gets all favorite artists from the database.
  Future<List<FavoriteArtist>> _getArtistsFromDb() async {
    try {
      return await _database.getallFavouriteArtists();
    } catch (error) {
      print('Error getting favorite artists from database: $error');
      return [];
    }
  }

  /// Gets favorite artists, either from the database or the API if not cached.
  Future<List<FavoriteArtist>> getFavoriteArtists() async {
    try {
      final dbArtists = await _getArtistsFromDb();
      if (dbArtists.isNotEmpty) {
        return dbArtists;
      }
      return await _cacheArtists(await _getFavoriteArtistsFromApi());
    } catch (error) {
      print('Error getting favorite artists: $error');
      return [];
    }
  }

  /// Get favorite artists from the API.
  Future<List<Artists>> _getFavoriteArtistsFromApi() async {
    try {
      final apiArtists = await _recentlyPlayedService.getFavoriteArtists();
      final apiArtistsResponse = apiArtists.body?.data as List<Artists>;
      return apiArtistsResponse;
    } catch (error) {
      print('Error getting favorite artists from API: $error');
      return [];
    }
  }
}

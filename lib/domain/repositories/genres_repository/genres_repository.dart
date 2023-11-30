import 'dart:async';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/services/api_service/service.dart';

class GenresRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService _genresService;

  GenresRepository(this._database, this._genresService);

  /// Caches the provided tracks into the database and returns the cached genres.
  Future<List<MusicGenre>> cacheTracks(List<Data> tracks) async {
    try {
      final genresToInsert = tracks.map((item) {
        return MusicGenre(
          id: item.id.toString(),
          name: item.name,
          image: item.image,
        );
      }).toList();

      await _database.addManyGenres(genresToInsert);

      return genresToInsert;
    } catch (error) {
      print('Error caching tracks: $error');
      return [];
    }
  }

  /// Gets all genres, either from the service or the database if cached.
  Future<List<MusicGenre>> getAllGenres() async {
    try {
      final isAvailable = await isTracksAvailable();
      if (isAvailable) {
        final result = await getGenresFromService();
        return await cacheTracks(result);
      } else {
        return await _database.getallGenres();
      }
    } catch (error) {
      print('Error getting all genres: $error');
      return [];
    }
  }

  /// Retrieves genres from the service.
  Future<List<Data>> getGenresFromService() async {
    try {
      final genresList = await _genresService.getGenres();
      final items = genresList.body?.data as List<Data>;
      return items;
    } catch (error) {
      print('Error getting genres from service: $error');
      return [];
    }
  }

  /// Checks if tracks are available in the database.
  Future<bool> isTracksAvailable() async {
    try {
      final dbTracks = await _database.getallGenres();
      return dbTracks.isEmpty;
    } catch (error) {
      print('Error checking if tracks are available: $error');
      return false;
    }
  }
}

import 'dart:async';
import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/domain/entity/models.dart';
import 'package:audio_player/app/domain/services/logger.dart';
import 'package:audio_player/app/domain/services/services.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

abstract class Genres {
  Future<List<MusicGenre>> getAllGenres();
}

@Injectable(as: Genres)
class GenresRepository implements Genres {
  final AudioAppDatabase _database;
  final AudioPlayerService _genresService;

  GenresRepository(this._database, this._genresService);
  final Logger _logger = getLogger('GenresRepository');

  /// Caches the provided tracks into the database and returns the cached genres.
  Future<List<MusicGenre>> _cacheTracks(List<Data> tracks) async {
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
    } catch (error, stackTrace) {
      _logger.severe('Error caching tracks: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Gets all genres, either from the service or the database if cached.
  @override
  Future<List<MusicGenre>> getAllGenres() async {
    try {
      final isAvailable = await _isTracksAvailable();
      if (isAvailable) {
        final result = await _getGenresFromService();
        return await _cacheTracks(result);
      } else {
        return await _database.getallGenres();
      }
    } catch (error, stackTrace) {
      _logger
          .severe('Error getting all genres: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Retrieves genres from the service.
  Future<List<Data>> _getGenresFromService() async {
    try {
      final genresList = await _genresService.getGenres();
      final items = genresList.body?.data as List<Data>;
      return items;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting genres from service: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Checks if tracks are available in the database.
  Future<bool> _isTracksAvailable() async {
    try {
      final dbTracks = await _database.getallGenres();
      return dbTracks.isEmpty;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error checking if tracks are available: $error, stack trace: $stackTrace');
      return false;
    }
  }
}

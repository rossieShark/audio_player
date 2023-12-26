import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/home_screen_data/home_screen_data.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:audio_player/domain/services/services.dart';
import 'package:logging/logging.dart';

abstract class BestAlbums {
  Future<List<Album>> getBestAlbums(int index, int limit);
}

class BestAlbumRepository implements BestAlbums {
  final AudioAppDatabase _database;
  final AudioPlayerService _recentlyPlayedService;

  BestAlbumRepository(this._database, this._recentlyPlayedService);
  final Logger _logger = getLogger('BestAlbumRepository');

  /// Caches albums into the database and returns the cached best albums.
  Future<List<Album>> _cacheAlbums(List<BestAlbumsList> albums) async {
    try {
      final albumsToInsert = albums.map((album) {
        return Album(
          type: album.type,
          title: album.title,
          id: album.id,
          image: album.coverImage,
          artist: album.artist.name,
        );
      }).toList();

      await _database.addManyAlbums(albumsToInsert);

      return albumsToInsert;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error caching best albums: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Gets all best albums from the database.
  Future<List<Album>> _getAlbumsFromDb() async {
    try {
      return await _database.getallBestAlbums();
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting best albums from database: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Gets best albums based on the provided index and limit.
  @override
  Future<List<Album>> getBestAlbums(int index, int limit) async {
    try {
      final dbAlbums = await _getAlbumsFromDb();

      if (dbAlbums.length < limit) {
        final albums = await _fetchAndCacheBestAlbums(index, limit);
        return await _cacheAlbums(albums);
      }

      final startIndex = index;
      final endIndex = limit;

      if (endIndex > dbAlbums.length) {
        final albums = await _fetchAndCacheBestAlbums(index, limit);
        return await _cacheAlbums(albums);
      }

      return dbAlbums.sublist(startIndex, endIndex);
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting best albums: $error, stack trace: $stackTrace');
      return [];
    }
  }

  /// Fetches best albums from the API and caches them into the database.
  Future<List<BestAlbumsList>> _fetchAndCacheBestAlbums(
      int index, int limit) async {
    try {
      final apiAlbumsResponse =
          await _recentlyPlayedService.getBestAlbums(index, limit);
      final apiAlbums = apiAlbumsResponse.body?.data as List<BestAlbumsList>;
      return apiAlbums;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error fetching and caching best albums: $error, stack trace: $stackTrace');
      return [];
    }
  }
}

abstract class BestAlbumsPagination {
  Future<void> loadMoreItems();
  List<Album> items = [];
}

class BestAlbumsPaginationService implements BestAlbumsPagination {
  final BestAlbums _bestAlbumsRepository;
  BestAlbumsPaginationService(this._bestAlbumsRepository);
  bool _isLoading = false;
  final int _perPage = 10;
  int _index = 0;
  int _limit = 10;

  @override
  List<Album> items = [];

  bool get isLoading => _isLoading;

  @override
  Future<void> loadMoreItems() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final newPortion =
          await _bestAlbumsRepository.getBestAlbums(_index, _limit);

      items.addAll(newPortion);
      _index += _perPage;
      _limit += _perPage;
    } finally {
      _isLoading = false;
    }
  }
}

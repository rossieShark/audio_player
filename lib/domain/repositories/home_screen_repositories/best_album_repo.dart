import 'package:audio_player/databases/database.dart';
import 'package:audio_player/domain/entity/home_screen_data/home_screen_data.dart';
import 'package:audio_player/domain/services/services.dart';

class BestAlbumRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService _recentlyPlayedService;

  BestAlbumRepository(this._database, this._recentlyPlayedService);

  /// Caches albums into the database and returns the cached best albums.
  Future<List<BestAlbum>> _cacheAlbums(List<BestAlbumsList> albums) async {
    try {
      final albumsToInsert = albums.map((album) {
        return BestAlbum(
          type: album.type,
          title: album.title,
          id: album.id,
          image: album.coverImage,
          detailAlbum: album.id,
          artist: album.artist.name,
        );
      }).toList();

      await _database.addManyAlbums(albumsToInsert);

      return albumsToInsert;
    } catch (error) {
      print('Error caching best albums: $error');
      return [];
    }
  }

  /// Gets all best albums from the database.
  Future<List<BestAlbum>> _getAlbumsFromDb() async {
    try {
      return await _database.getallBestAlbums();
    } catch (error) {
      print('Error getting best albums from database: $error');
      return [];
    }
  }

  /// Gets best albums based on the provided index and limit.
  Future<List<BestAlbum>> getBestAlbums(int index, int limit) async {
    try {
      final dbAlbums = await _getAlbumsFromDb();

      if (dbAlbums.length < limit) {
        return await _fetchAndCacheBestAlbums(index, limit);
      }

      final startIndex = index;
      final endIndex = limit;

      if (endIndex > dbAlbums.length) {
        return await _fetchAndCacheBestAlbums(index, limit);
      }

      return dbAlbums.sublist(startIndex, endIndex);
    } catch (error) {
      print('Error getting best albums: $error');
      return [];
    }
  }

  /// Fetches best albums from the API and caches them into the database.
  Future<List<BestAlbum>> _fetchAndCacheBestAlbums(int index, int limit) async {
    try {
      final apiAlbumsResponse =
          await _recentlyPlayedService.getBestAlbums(index, limit);
      final apiAlbums = apiAlbumsResponse.body?.data as List<BestAlbumsList>;
      return await _cacheAlbums(apiAlbums);
    } catch (error) {
      print('Error fetching and caching best albums: $error');
      return [];
    }
  }
}

class BestAlbumsPaginationService {
  final BestAlbumRepository _bestAlbumsRepository;
  BestAlbumsPaginationService(this._bestAlbumsRepository);
  bool _isLoading = false;
  final int _perPage = 10;
  int _index = 0;
  int _limit = 10;

  List<BestAlbum> items = [];

  bool get isLoading => _isLoading;

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

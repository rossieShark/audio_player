import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/repositories/favourites_repository.dart/favourites_repo.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:logging/logging.dart';

class FavouriteAlbumRepository implements Favourites {
  final AudioAppDatabase _database;

  FavouriteAlbumRepository(this._database);
  final Logger _logger = getLogger('FavouriteAlbumRepository');
  @override
  Future<List<SongModel>> addToFavorites(SongModel detailSong) async {
    try {
      await _database.insertFavoritAlbum(
        FavoriteAlbum(
          preview: detailSong.preview,
          type: detailSong.type,
          id: int.parse(detailSong.id),
          title: detailSong.title,
          artist: detailSong.artistNames,
          songImage: detailSong.image,
          isFavourite: detailSong.isFavourite,
        ),
      );
      return loadFavourites();
    } catch (error, stackTrace) {
      // Handle or log the error as needed
      _logger.severe('Error adding to favorite albums: $error\n$stackTrace');
      return [];
    }
  }

  @override
  Future<List<SongModel>> removeFromFavorites(SongModel detailSong) async {
    try {
      await _database.deleteFavoriteAlbum(int.parse(detailSong.id));
      return loadFavourites();
    } catch (error, stackTrace) {
      // Handle or log the error as needed
      _logger
          .severe('Error removing from favorite albums: $error\n$stackTrace');
      return [];
    }
  }

  @override
  Future<bool> isFavourite(String albumId) async {
    try {
      final albums = await loadFavourites();
      bool isFavorite = albums.any((album) => album.id == albumId);
      return isFavorite;
    } catch (error, stackTrace) {
      // Handle or log the error as needed
      _logger
          .severe('Error checking if album is favorite: $error\n$stackTrace');
      return false;
    }
  }

  @override
  Future<List<SongModel>> loadFavourites() async {
    try {
      final favoriteAlbums = await _database.getFavoriteAlbums();
      final loadedFavoriteAlbums = favoriteAlbums
          .map(
            (favoriteAlbum) => SongModel(
              preview: favoriteAlbum.preview,
              type: favoriteAlbum.type,
              id: favoriteAlbum.id.toString(),
              title: favoriteAlbum.title,
              artistNames: favoriteAlbum.artist,
              image: favoriteAlbum.songImage,
              isFavourite: favoriteAlbum.isFavourite,
            ),
          )
          .toList();
      return loadedFavoriteAlbums;
    } catch (error, stackTrace) {
      // Handle or log the error as needed
      _logger.severe('Error loading favorite albums: $error\n$stackTrace');
      return [];
    }
  }
}

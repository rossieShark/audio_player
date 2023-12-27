import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';
import 'package:audio_player/domain/repositories/favourites_repository.dart/favourites_repo.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Named("favouriteSongs")
@Injectable(as: Favourites)
class FavouriteSongRepository implements Favourites {
  final AudioAppDatabase _database;

  FavouriteSongRepository(this._database);
  final Logger _logger = getLogger('FavouriteSongRepository');
  @override
  Future<List<SongModel>> addToFavorites(SongModel detailSong) async {
    try {
      await _database.insertFavoriteSong(
        FavoriteSong(
          preview: detailSong.preview,
          type: detailSong.type,
          id: int.parse(detailSong.id),
          title: detailSong.title,
          artist: detailSong.artistNames,
          songImage: detailSong.image,
          isFavourite: detailSong.isFavourite,
        ),
      );
      return await loadFavourites();
    } catch (error, stackTrace) {
      // Handle or log the error as needed
      _logger.severe('Error adding to favorites: $error\n$stackTrace');
      return [];
    }
  }

  @override
  Future<List<SongModel>> loadFavourites() async {
    try {
      final favoriteSongs = await _database.getFavoriteSongs();
      final loadedFavoriteSongs = favoriteSongs
          .map(
            (favoriteSong) => SongModel(
              preview: favoriteSong.preview,
              type: favoriteSong.type,
              id: favoriteSong.id.toString(),
              title: favoriteSong.title,
              artistNames: favoriteSong.artist,
              image: favoriteSong.songImage,
              isFavourite: favoriteSong.isFavourite,
            ),
          )
          .toList();
      return loadedFavoriteSongs;
    } catch (error, stackTrace) {
      // Handle or log the error as needed
      _logger.severe('Error loading favorites: $error\n$stackTrace');
      return [];
    }
  }

  @override
  Future<bool> isFavourite(String songId) async {
    try {
      final tracks = await loadFavourites();
      bool isFavorite = tracks.any((song) => song.id == songId);
      return isFavorite;
    } catch (error, stackTrace) {
      // Handle or log the error as needed
      _logger.severe('Error checking if song is favorite: $error\n$stackTrace');
      return false;
    }
  }

  @override
  Future<List<SongModel>> removeFromFavorites(SongModel detailSong) async {
    try {
      await _database.deleteFavoriteSong(int.parse(detailSong.id));
      final tracks = await loadFavourites();
      return tracks;
    } catch (error, stackTrace) {
      // Handle or log the error as needed
      _logger.severe('Error removing from favorites: $error\n$stackTrace');
      return [];
    }
  }
}

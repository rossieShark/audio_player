import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/repositories/favourites_repository.dart/favourites_repo.dart';

class FavouriteAlbumRepository implements Favourites {
  final AudioAppDatabase _database;

  FavouriteAlbumRepository(this._database);

  @override
  Future<List<SongModel>> addToFavorites(SongModel detailSong) async {
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
  }

  @override
  Future<List<SongModel>> removeFromFavorites(SongModel detailSong) async {
    await _database.deleteFavoriteAlbum(int.parse(detailSong.id));
    return loadFavourites();
  }

  @override
  Future<bool> isFavourite(String albumId) async {
    final albums = await loadFavourites();
    bool isFavorite = albums.any((album) => album.id == albumId);
    return isFavorite;
  }

  @override
  Future<List<SongModel>> loadFavourites() async {
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
              isFavourite: favoriteAlbum.isFavourite),
        )
        .toList();
    return loadedFavoriteAlbums;
  }
}

import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/models.dart';

class FavouriteAlbumRepository {
  final AudioAppDatabase _database;

  FavouriteAlbumRepository(this._database);

  Future<List<SongModel>> addToFavoritesAlbum(SongModel detailSong) async {
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
    return loadAlbums();
  }

  Future<List<SongModel>> removeFromFavoritesAlbum(SongModel detailSong) async {
    await _database.deleteFavoriteAlbum(int.parse(detailSong.id));
    return loadAlbums();
  }

  Future<bool> isFavourite(String albumId) async {
    final albums = await loadAlbums();
    bool isFavorite = albums.any((album) => album.id == albumId);
    return isFavorite;
  }

  Future<List<SongModel>> loadAlbums() async {
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

import 'package:audio_player/databases/database.dart';
import 'package:audio_player/domain/entity/favorite_folder_model.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';

class DatabaseService {
  final AudioAppDatabase _database;
  DatabaseService(this._database);
  Future<void> addToFavorites(SongModel detailSong) async {
    await _database.insertFavoriteSong(
      FavoriteSong(
          preview: detailSong.preview,
          type: detailSong.type,
          id: int.parse(detailSong.id),
          title: detailSong.title,
          artist: detailSong.artistNames,
          songImage: detailSong.image,
          isFavourite: detailSong.isFavourite),
    );
  }

  Future<List<SongModel>> loadSongs() async {
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
              isFavourite: favoriteSong.isFavourite),
        )
        .toList();
    return loadedFavoriteSongs;
  }

  Future<void> removeSongFromDatabase(SongModel detailSong) async {
    await _database.deleteFavoriteSong(int.parse(detailSong.id));
  }

  Future<void> addToFavoritesAlbum(SongModel detailSong) async {
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
  }

  Future<void> removeFromFavoritesAlbum(SongModel detailSong) async {
    await _database.deleteFavoriteAlbum(int.parse(detailSong.id));
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

  Future<List<FavoriteFolder>> returnMyMusicFolderList() async {
    final folders = await _database.getFolders();
    final loadedFolders = folders
        .map(
          (folder) => FavoriteFolder(
            title: folder.name,
            image: folder.image,
          ),
        )
        .toList();
    return loadedFolders;
  }

  Future<void> addToFolders(FavoriteFolder folder) async {
    await _database.insertToMyFolders(
      MyMusicFolder(
        name: folder.title,
        image: folder.image,
      ),
    );
  }

  Future<List<SongModel>> loadRecentlySearched() async {
    final recentlySearchedSongs = await _database.getRecentlySearchedSongs();
    final loadedRecentlySearchedSongs = recentlySearchedSongs
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
    return loadedRecentlySearchedSongs;
  }

  Future<void> addToRecentlySearched(SongModel detailSong) async {
    await _database.insertRecentlySearched(
      RecentlySearchedSong(
        preview: detailSong.preview,
        type: detailSong.type,
        id: int.parse(detailSong.id),
        title: detailSong.title,
        artist: detailSong.artistNames,
        songImage: detailSong.image,
        isFavourite: detailSong.isFavourite,
      ),
    );
  }

  Future<void> removeFromRecentlySearched(SongModel detailSong) async {
    await _database.deleteRecentlySearched(int.parse(detailSong.id));
  }

  Future<void> removeAllRecentlySearched() async {
    await _database.clearAll();
  }
}

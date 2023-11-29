import 'package:audio_player/databases/database.dart';
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
}

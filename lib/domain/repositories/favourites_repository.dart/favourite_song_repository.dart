import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';

class FavouriteSongRepository {
  final AudioAppDatabase _database;

  FavouriteSongRepository(this._database);

  Future<List<SongModel>> addToFavorites(SongModel detailSong) async {
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
    return await loadSongs();
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

  Future<bool> isFavourite(String songId) async {
    final tracks = await loadSongs();
    bool isFavorite = tracks.any((song) => song.id == songId);
    return isFavorite;
  }

  Future<List<SongModel>> removeSongFromDatabase(SongModel detailSong) async {
    await _database.deleteFavoriteSong(int.parse(detailSong.id));
    final tracks = await loadSongs();
    return tracks;
  }
}

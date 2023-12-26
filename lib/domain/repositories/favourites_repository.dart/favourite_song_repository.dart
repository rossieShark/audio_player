import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';
import 'package:audio_player/domain/repositories/favourites_repository.dart/favourites_repo.dart';

class FavouriteSongRepository implements Favourites {
  final AudioAppDatabase _database;

  FavouriteSongRepository(this._database);

  @override
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
    return await loadFavourites();
  }

  @override
  Future<List<SongModel>> loadFavourites() async {
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

  @override
  Future<bool> isFavourite(String songId) async {
    final tracks = await loadFavourites();
    bool isFavorite = tracks.any((song) => song.id == songId);
    return isFavorite;
  }

  @override
  Future<List<SongModel>> removeFromFavorites(SongModel detailSong) async {
    await _database.deleteFavoriteSong(int.parse(detailSong.id));
    final tracks = await loadFavourites();
    return tracks;
  }
}

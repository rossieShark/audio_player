import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';

abstract class RecentlySearchedRepo {
  Future<List<SongModel>> loadFromDatabase();
  Future<List<SongModel>> addToRecentlySearched(SongModel detailSong);
  Future<List<SongModel>> removeFromRecentlySearched(SongModel detailSong);
  Future<void> removeAllRecentlySearched();
}

class RecentlySearchedRepository implements RecentlySearchedRepo {
  final AudioAppDatabase _database;

  RecentlySearchedRepository(this._database);

  @override
  Future<List<SongModel>> loadFromDatabase() async {
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

  @override
  Future<List<SongModel>> addToRecentlySearched(SongModel detailSong) async {
    bool isUniqueSong = await isUnique(detailSong.id);
    if (isUniqueSong) {
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
      return await loadFromDatabase();
    }
    return await loadFromDatabase();
  }

  @override
  Future<List<SongModel>> removeFromRecentlySearched(
      SongModel detailSong) async {
    await _database.deleteRecentlySearched(int.parse(detailSong.id));
    return await loadFromDatabase();
  }

  Future<bool> isUnique(String id) async {
    final recentlySearched = await loadFromDatabase();
    return recentlySearched.every((song) => song.id != id);
  }

  @override
  Future<void> removeAllRecentlySearched() async {
    await _database.clearAll();
  }
}

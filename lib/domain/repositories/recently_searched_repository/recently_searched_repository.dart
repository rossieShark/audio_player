import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';

class RecentlySearchedRepository {
  final AudioAppDatabase _database;

  RecentlySearchedRepository(this._database);

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

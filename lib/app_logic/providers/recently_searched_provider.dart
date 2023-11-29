import 'package:audio_player/databases/database.dart';

import 'package:audio_player/domain/entity/models.dart';
import 'package:flutter/material.dart';

class RecentlySearchedProvider extends ChangeNotifier {
  final AudioAppDatabase _database;
  final List<SongModel> _recentlySearchedList = [];
  RecentlySearchedProvider(this._database);
  List<SongModel> get recentlySearchedList => _recentlySearchedList;

  Future<void> addToFavorites(SongModel detailSong) async {
    _recentlySearchedList.add(detailSong);
    notifyListeners();
    await _database.insertRecentlySearched(
      RecentlySearchedSong(
        preview: detailSong.preview,
        type: detailSong.type,
        id: int.parse(detailSong.id),
        title: detailSong.title,
        artist: detailSong.artistNames,
        songImage: detailSong.image, isFavourite: detailSong.isFavourite,
      ),
    );
  }

  Future<void> removeFromFavorites(SongModel detailSong) async {
    _recentlySearchedList.removeWhere((item) => item.id == detailSong.id);
    notifyListeners();
    await _database.deleteFavoriteSong(int.parse(detailSong.id));
  }

  Future<void> removeAll() async {
    _recentlySearchedList.clear();
    notifyListeners();
    await _database.clearAll();
  }

  Future<void> loadRecentlySearched() async {
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
    _recentlySearchedList.clear();
    _recentlySearchedList.addAll(loadedRecentlySearchedSongs);
    notifyListeners();
  }
}

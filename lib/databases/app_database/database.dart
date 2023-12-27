import 'package:audio_player/databases/app_database/tables.dart';
import 'package:audio_player/databases/connection/connection.dart' as impl;

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  RecentlyPlayedSongs,
  FavoriteArtists,
  Albums,
  DetailAlbums,
  FavoriteAlbums,
  FavoriteSongs,
  RecentlySearchedSongs,
  DetailInfoSongs,
  MusicGenres,
  MyMusicFolders
])
@lazySingleton
class AudioAppDatabase extends _$AudioAppDatabase {
  AudioAppDatabase() : super(impl.connect());

  @override
  int get schemaVersion => 7;

//RecentlyPlayedSong
  Future<List<RecentlyPlayedSong>> getallRecentlyPlayedSongs() {
    return select(recentlyPlayedSongs).get();
  }

  Future<void> addSongItem(RecentlyPlayedSong recentlyPlayedSong) {
    return into(recentlyPlayedSongs).insert(recentlyPlayedSong);
  }

  Future<void> addManySongs(List<RecentlyPlayedSong> items) async {
    await batch((batch) {
      batch.insertAll(recentlyPlayedSongs, items);
    });
  }

//FavoriteArtist
  Future<List<FavoriteArtist>> getallFavouriteArtists() {
    return select(favoriteArtists).get();
  }

  Future<void> addManyFavoriteArtists(List<FavoriteArtist> items) async {
    await batch((batch) {
      batch.insertAll(favoriteArtists, items);
    });
  }

//BestAlbum
  Future<List<Album>> getallBestAlbums() {
    return select(albums).get();
  }

  Future<void> addManyAlbums(List<Album> items) async {
    await batch((batch) {
      batch.insertAll(albums, items);
    });
  }

  Future<int> deleteAll() {
    return delete(albums).go();
  }

//DetailAlbum
  Future<List<DetailAlbum>> get AllDetailAlbums => select(detailAlbums).get();

  Future<void> addDetailAlbum(DetailAlbum detailAlbum) =>
      into(detailAlbums).insert(detailAlbum);

  Stream<List<DetailAlbum>> watchInfoInDetailAlbum(int id) {
    return (select(detailAlbums)..where((t) => t.albumid.equals(id))).watch();
  }

  Future<void> addManyDetailAlbums(List<DetailAlbum> items) async {
    await batch((batch) {
      batch.insertAll(detailAlbums, items);
    });
  }

//DetailInfoSong
  Future<void> addDetailSong(DetailInfoSong detailInfoSong) =>
      into(detailInfoSongs).insert(detailInfoSong);

  Stream<DetailInfoSong?> watchDetailSongById(int id) {
    return (select(detailInfoSongs)..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  Future<void> insertDetailSong(DetailInfoSong detailInfoSong) =>
      into(detailInfoSongs).insert(detailInfoSong, mode: InsertMode.replace);

//FavoriteSong

  Future<List<FavoriteSong>> getFavoriteSongs() => select(favoriteSongs).get();

  Future<void> insertFavoriteSong(FavoriteSong song) =>
      into(favoriteSongs).insert(song, mode: InsertMode.replace);

  Future<void> deleteFavoriteSong(int songId) =>
      (delete(favoriteSongs)..where((song) => song.id.equals(songId))).go();

//FavoriteAlbum
  Future<List<FavoriteAlbum>> getFavoriteAlbums() =>
      select(favoriteAlbums).get();

  Future<void> insertFavoritAlbum(FavoriteAlbum song) =>
      into(favoriteAlbums).insert(song, mode: InsertMode.replace);

  Future<void> deleteFavoriteAlbum(int songId) =>
      (delete(favoriteAlbums)..where((song) => song.id.equals(songId))).go();

//RecentlySearchedSong
  Future<List<RecentlySearchedSong>> getRecentlySearchedSongs() =>
      select(recentlySearchedSongs).get();
  Future<void> insertRecentlySearched(RecentlySearchedSong song) =>
      into(recentlySearchedSongs).insert(song, mode: InsertMode.replace);

  Future<void> clearAll() => delete(recentlySearchedSongs).go();
  Future<void> deleteRecentlySearched(int songId) =>
      (delete(recentlySearchedSongs)..where((song) => song.id.equals(songId)))
          .go();
//Genres
  Future<List<MusicGenre>> getallGenres() {
    return select(musicGenres).get();
  }

  Future<void> addManyGenres(List<MusicGenre> items) async {
    await batch((batch) {
      batch.insertAll(musicGenres, items);
    });
  }

//MyMusicFolders
  Future<List<MyMusicFolder>> getFolders() => select(myMusicFolders).get();

  Future<void> insertToMyFolders(MyMusicFolder folder) =>
      into(myMusicFolders).insert(folder, mode: InsertMode.replace);

  Future<void> deleteFolder(String name) =>
      (delete(myMusicFolders)..where((song) => song.name.equals(name))).go();

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }

//MIGRATION

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) async {
      await m.createAll();
    }, onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.addColumn(recentlyPlayedSongs, recentlyPlayedSongs.type);
      }
      if (from < 3) {
        await m.createTable(myMusicFolders);
      }
      if (from < 7) {
        m.createTable(albums);
      }
    });
  }
}

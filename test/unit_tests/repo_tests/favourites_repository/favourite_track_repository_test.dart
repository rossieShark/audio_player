import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/repositories/favourites_repository.dart/favourite_song_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AudioDatabaseMock extends Mock implements AudioAppDatabase {}

void main() {
  registerFallbackValue(createTestTracks());
  registerFallbackValue(1);
  group('FavouriteSongRepository tests', () {
    late AudioDatabaseMock audioDatabase;

    late FavouriteSongRepository repository;

    setUp(() {
      audioDatabase = AudioDatabaseMock();
      repository = FavouriteSongRepository(audioDatabase);
    });

    test('loadSongs should return a list of SongModel', () async {
      // Arrange
      when(() => audioDatabase.getFavoriteSongs())
          .thenAnswer((_) => Future.value([createTestTracks()]));

      // Act
      final result = await repository.loadSongs();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].id, '1');
      verify(() => audioDatabase.getFavoriteSongs()).called(1);
    });

    test('addToFavorites should return a list of SongModel', () async {
      // Arrange
      final songModel = createSongModdel();
      when(() => audioDatabase.getFavoriteSongs())
          .thenAnswer((_) => Future.value([createTestTracks()]));
      when(() => audioDatabase.insertFavoriteSong(any()))
          .thenAnswer((_) => Future.value());
      // Act
      final resultFuture = repository.addToFavorites(songModel);

      // Assert
      await expectLater(resultFuture, completion(isNotNull));

      final result = await resultFuture;
      expect(result.length, 1);
      expect(result[0].id, '1');

      verify(() => audioDatabase.getFavoriteSongs()).called(1);
      verify(() => audioDatabase.insertFavoriteSong(any())).called(1);
    });

    test('isFavourite should return true', () async {
      // Arrange
      when(() => audioDatabase.getFavoriteSongs())
          .thenAnswer((_) => Future.value([createTestTracks()]));

      // Act
      final resultFuture = repository.isFavourite('1');

      // Assert
      await expectLater(resultFuture, completion(isNotNull));

      final result = await resultFuture;
      expect(result, true);
      verify(() => audioDatabase.getFavoriteSongs()).called(1);
    });

    test('isFavourite should return false', () async {
      // Arrange
      when(() => audioDatabase.getFavoriteSongs())
          .thenAnswer((_) => Future.value([createTestTracks()]));

      // Act
      final resultFuture = repository.isFavourite('2');

      // Assert
      await expectLater(resultFuture, completion(isNotNull));

      final result = await resultFuture;
      expect(result, false);
      verify(() => audioDatabase.getFavoriteSongs()).called(1);
    });

    test('removeSongFromDatabase should return a list of SongModel', () async {
      // Arrange
      final songModel = createSongModdel();
      when(() => audioDatabase.getFavoriteSongs())
          .thenAnswer((_) => Future.value([createTestTracks()]));
      when(() => audioDatabase.deleteFavoriteSong(any()))
          .thenAnswer((_) => Future<void>.value());
      // Act
      final resultFuture = repository.removeSongFromDatabase(songModel);

      // Assert
      await expectLater(resultFuture, completion(isNotNull));

      final result = await resultFuture;
      expect(result.length, 1);
      expect(result[0].id, '1');

      verify(() => audioDatabase.getFavoriteSongs()).called(1);
      verify(() => audioDatabase.deleteFavoriteSong(any())).called(1);
    });
  });
}

FavoriteSong createTestTracks() {
  return const FavoriteSong(
      id: 1,
      title: 'title',
      artist: 'artist',
      songImage: 'songImage',
      type: 'track',
      preview: 'preview',
      isFavourite: true);
}

SongModel createSongModdel() {
  return SongModel(
      id: '1',
      title: 'title',
      artistNames: 'artist',
      type: 'track',
      preview: 'preview',
      isFavourite: true,
      image: 'image');
}

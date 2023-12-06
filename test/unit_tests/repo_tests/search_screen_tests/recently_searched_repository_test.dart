import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/repositories/recently_searched_repository/recently_searched_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AudioDatabaseMock extends Mock implements AudioAppDatabase {}

void main() {
  setUpAll(() {
    registerFallbackValue(createTestSong());
  });

  group('RecentlySearchedRepository tests', () {
    late AudioDatabaseMock audioDatabase;
    late RecentlySearchedRepository repository;

    setUp(() {
      audioDatabase = AudioDatabaseMock();
      repository = RecentlySearchedRepository(audioDatabase);
    });

    test('should return a list of recently searched songs', () async {
      // Arrange
      when(() => audioDatabase.getRecentlySearchedSongs())
          .thenAnswer((_) => Future.value([createTestSong()]));

      // Act
      final result = await repository.loadFromDatabase();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].title, 'title');
      verify(() => audioDatabase.getRecentlySearchedSongs()).called(1);
    });

    test('addToRecentlySearched when adding a non-unique element', () async {
      // Arrange
      when(() => audioDatabase.getRecentlySearchedSongs())
          .thenAnswer((_) => Future.value([createTestSong()]));

      // Act
      final resultFuture =
          repository.addToRecentlySearched(createTestAddSong());

      // Assert
      await expectLater(resultFuture, completion(isNotNull));

      final result = await resultFuture;
      expect(result.length, 1); // The list should still have one element
      expect(result[0].id, '1'); // Assuming the original song has id 1
      // Ensure that insertRecentlySearched is never called
      verifyNever(() => audioDatabase.insertRecentlySearched(any()));
    });

    test('addToRecentlySearched when adding a unique element', () async {
      // Arrange
      when(() => audioDatabase.getRecentlySearchedSongs())
          .thenAnswer((_) => Future.value([createTestSong()]));
      when(() => audioDatabase.insertRecentlySearched(any()))
          .thenAnswer((_) => Future.value());

      // Act
      final resultFuture =
          repository.addToRecentlySearched(createTestUniqueAddSong());

      // Assert
      await expectLater(resultFuture, completion(isNotNull));
      // Ensure that insertRecentlySearched is called once
      verify(() => audioDatabase.insertRecentlySearched(any())).called(1);
    });

    test('isUnique should return true', () async {
      // Arrange
      when(() => audioDatabase.getRecentlySearchedSongs())
          .thenAnswer((_) => Future.value([createTestSong()]));

      // Act
      final resultFuture = repository.isUnique('2');

      // Assert
      await expectLater(resultFuture, completion(isNotNull));

      final result = await resultFuture;
      expect(result, true);
      verify(() => audioDatabase.getRecentlySearchedSongs()).called(1);
    });

    test('isUnique should return false', () async {
      // Arrange
      when(() => audioDatabase.getRecentlySearchedSongs())
          .thenAnswer((_) => Future.value([createTestSong()]));

      // Act
      final resultFuture = repository.isUnique('1');

      // Assert
      await expectLater(resultFuture, completion(isNotNull));

      final result = await resultFuture;
      expect(result, false);
      verify(() => audioDatabase.getRecentlySearchedSongs()).called(1);
    });

    test('removeFromRecentlySearched should return Future<List<SongModel>>',
        () async {
      // Arrange
      final songModel = createTestAddSong();
      when(() => audioDatabase.getRecentlySearchedSongs())
          .thenAnswer((_) => Future.value([createTestSong()]));
      when(() => audioDatabase.deleteRecentlySearched(any()))
          .thenAnswer((_) => Future<void>.value());

      // Act
      final resultFuture = repository.removeFromRecentlySearched(songModel);

      // Assert
      await expectLater(resultFuture, completion(isNotNull));

      final result = await resultFuture;
      expect(result.length, 1);
      expect(result[0].id, '1');

      verify(() => audioDatabase.getRecentlySearchedSongs()).called(1);
      verify(() => audioDatabase.deleteRecentlySearched(any())).called(1);
    });

    test('removeAllRecentlySearched should return Future<List<SongModel>>',
        () async {
      // Arrange
      when(() => audioDatabase.clearAll())
          .thenAnswer((_) => Future<void>.value());

      // Act
      final resultFuture = repository.removeAllRecentlySearched();

      // Assert
      await expectLater(resultFuture, completion(null));
      verify(() => audioDatabase.clearAll()).called(1);
    });
  });
}

RecentlySearchedSong createTestSong() {
  return const RecentlySearchedSong(
      id: 1,
      title: 'title',
      artist: 'artist',
      type: 'album',
      songImage: 'songImage',
      preview: 'preview',
      isFavourite: false);
}

SongModel createTestAddSong() {
  return SongModel(
      id: "1",
      title: 'title',
      artistNames: 'artist',
      type: 'album',
      image: 'songImage',
      preview: 'preview',
      isFavourite: false);
}

SongModel createTestUniqueAddSong() {
  return SongModel(
      id: "2",
      title: 'title',
      artistNames: 'artist',
      type: 'album',
      image: 'songImage',
      preview: 'preview',
      isFavourite: false);
}

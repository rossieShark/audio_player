import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/repositories/favourites_repository.dart/favourite_album_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AudioDatabaseMock extends Mock implements AudioAppDatabase {}

void main() {
  setUpAll(() {
    registerFallbackValue(_createTestAlbums());
    registerFallbackValue(1);
  });

  group('FavouriteAlbumRepository tests', () {
    late AudioDatabaseMock audioDatabase;
    late FavouriteAlbumRepository repository;

    setUp(() {
      audioDatabase = AudioDatabaseMock();
      repository = FavouriteAlbumRepository(audioDatabase);
    });

    test('loadAlbums should return a list of AlbumModel', () async {
      // Arrange
      when(() => audioDatabase.getFavoriteAlbums())
          .thenAnswer((_) => Future.value([_createTestAlbums()]));

      // Act
      final result = await repository.loadAlbums();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].id, '1');
      verify(() => audioDatabase.getFavoriteAlbums()).called(1);
    });

    test('addToFavoritesAlbum should return a list of AlbumModel', () async {
      // Arrange
      final albumModel = _createAlbumModel();
      when(() => audioDatabase.getFavoriteAlbums())
          .thenAnswer((_) => Future.value([_createTestAlbums()]));
      when(() => audioDatabase.insertFavoritAlbum(any()))
          .thenAnswer((_) => Future.value());
      // Act
      final resultFuture = repository.addToFavoritesAlbum(albumModel);

      // Assert
      await expectLater(resultFuture, completion(isNotNull));

      final result = await resultFuture;
      expect(result.length, 1);
      expect(result[0].id, '1');

      verify(() => audioDatabase.getFavoriteAlbums()).called(1);
      verify(() => audioDatabase.insertFavoritAlbum(any())).called(1);
    });

    test('isFavourite should return true', () async {
      // Arrange
      when(() => audioDatabase.getFavoriteAlbums())
          .thenAnswer((_) => Future.value([_createTestAlbums()]));

      // Act
      final resultFuture = repository.isFavourite('1');

      // Assert
      await expectLater(resultFuture, completion(isNotNull));

      final result = await resultFuture;
      expect(result, true);
      verify(() => audioDatabase.getFavoriteAlbums()).called(1);
    });

    test('isFavourite should return false', () async {
      // Arrange
      when(() => audioDatabase.getFavoriteAlbums())
          .thenAnswer((_) => Future.value([_createTestAlbums()]));

      // Act
      final resultFuture = repository.isFavourite('2');

      // Assert
      await expectLater(resultFuture, completion(isNotNull));

      final result = await resultFuture;
      expect(result, false);
      verify(() => audioDatabase.getFavoriteAlbums()).called(1);
    });

    test('removeFromFavoritesAlbum should return a list of AlbumModel',
        () async {
      // Arrange
      final albumModel = _createAlbumModel();
      when(() => audioDatabase.getFavoriteAlbums())
          .thenAnswer((_) => Future.value([_createTestAlbums()]));
      when(() => audioDatabase.deleteFavoriteAlbum(any()))
          .thenAnswer((_) => Future<void>.value());
      // Act
      final resultFuture = repository.removeFromFavoritesAlbum(albumModel);

      // Assert
      await expectLater(resultFuture, completion(isNotNull));

      final result = await resultFuture;
      expect(result.length, 1);
      expect(result[0].id, '1');

      verify(() => audioDatabase.getFavoriteAlbums()).called(1);
      verify(() => audioDatabase.deleteFavoriteAlbum(any())).called(1);
    });
  });
}

FavoriteAlbum _createTestAlbums() {
  return const FavoriteAlbum(
      id: 1,
      title: 'title',
      artist: 'artist',
      songImage: 'songImage',
      type: 'album',
      preview: 'preview',
      isFavourite: true);
}

SongModel _createAlbumModel() {
  return SongModel(
      id: '1',
      title: 'title',
      artistNames: 'artist',
      type: 'track',
      preview: 'preview',
      isFavourite: true,
      image: 'image');
}

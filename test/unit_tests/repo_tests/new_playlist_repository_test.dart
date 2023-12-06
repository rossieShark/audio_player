import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/repositories/new_playlist_repository/new_playlist_repository.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AudioDatabaseMock extends Mock implements AudioAppDatabase {}

void main() {
  setUpAll(() {
    // Registering a fallback value for createTestPlaylists.
    registerFallbackValue(createTestPlaylists());
  });

  group('NewPlaylistRepository tests', () {
    late AudioDatabaseMock audioDatabase;
    late NewPlaylistRepository repository;

    setUp(() {
      audioDatabase = AudioDatabaseMock();
      repository = NewPlaylistRepository(audioDatabase);
    });

    test('should return a list of favorite folders when loading playlists',
        () async {
      // Arrange
      when(() => audioDatabase.getFolders())
          .thenAnswer((_) => Future.value([createTestPlaylists()]));

      // Act
      final result = await repository.loadPlaylists();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].title, 'name');
      verify(() => audioDatabase.getFolders()).called(1);
    });

    test('addToFolders should return List<FavoriteFolder>', () async {
      // Arrange
      when(() => audioDatabase.getFolders())
          .thenAnswer((_) => Future.value([createTestPlaylists()]));
      when(() => audioDatabase.insertToMyFolders(any()))
          .thenAnswer((_) => Future.value());

      // Act
      final resultFuture = repository.addToFolders('name');

      // Assert
      await expectLater(resultFuture, completion(isNotNull));

      final result = await resultFuture;
      expect(result.length, 1);
      expect(result[0].image, 'image');
      verify(() => audioDatabase.insertToMyFolders(any())).called(1);
    });

    test('convertToFavoriteFolder should return FavoriteFolder', () async {
      // Act
      final result = repository.convertToFavoriteFolder('name12');

      // Assert
      expect(result.image, AppImages.playlist);
      expect(result.title, 'name12');
    });
  });
}

MyMusicFolder createTestPlaylists() {
  return const MyMusicFolder(name: 'name', image: 'image');
}

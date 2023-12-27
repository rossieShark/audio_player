import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/domain/entity/home_screen_data/favourite_artist_model/favourite_artist_model.dart';
import 'package:audio_player/app/domain/repositories/index.dart';
import 'package:audio_player/app/domain/services/services.dart';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('FavoriteArtistRepository tests', () {
    late AudioDatabaseMock audioDatabase;
    late AudioPlayerServiceMock audioPlayerServiceMock;
    late FavoriteArtistRepository favoriteArtistRepository;

    setUp(() {
      audioDatabase = AudioDatabaseMock();
      audioPlayerServiceMock = AudioPlayerServiceMock();
      favoriteArtistRepository =
          FavoriteArtistRepository(audioDatabase, audioPlayerServiceMock);
    });

    test('getFavoriteArtists should return artists from the database',
        () async {
      // Arrange
      when(() => audioDatabase.getallFavouriteArtists())
          .thenAnswer((_) => Future.value(createFavoriteTestList()));

      // Act
      final result = await favoriteArtistRepository.getFavoriteArtists();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 2);
      expect(result[0].name, 'Artist1');
      verifyNever(() => audioPlayerServiceMock.getFavoriteArtists());
    });

    test('getFavoriteArtists should return artists from the API', () async {
      // Arrange
      final artistsListResponse = createTestArtistsResponse();
      final response = createTestResponse(artistsListResponse);

      when(() => audioDatabase.getallFavouriteArtists())
          .thenAnswer((_) => Future.value([]));

      when(() => audioPlayerServiceMock.getFavoriteArtists())
          .thenAnswer((_) => Future.value(response));

      when(() => audioDatabase.addManyFavoriteArtists(
              [const FavoriteArtist(name: 'name', id: 1, image: 'image')]))
          .thenAnswer((_) => Future<void>.value());

      // Act
      final result = await favoriteArtistRepository.getFavoriteArtists();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].image, 'image');
      verify(() => audioPlayerServiceMock.getFavoriteArtists()).called(1);
    });

    test(
        'getFavoriteArtists should return empty list when both database and API fail',
        () async {
      // Arrange
      when(() => audioDatabase.getallFavouriteArtists())
          .thenThrow(Exception('Test Error'));
      when(() => audioPlayerServiceMock.getRecentlyPlayedTracks())
          .thenThrow(Exception('Test Error'));

      // Act
      final result = await favoriteArtistRepository.getFavoriteArtists();

      // Assert
      expect(result, isEmpty);
    });
  });
}

class AudioDatabaseMock extends Mock implements AudioAppDatabase {}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}

// Helper methods to create test data
List<FavoriteArtist> createFavoriteTestList() {
  return [
    const FavoriteArtist(name: 'Artist1', id: 1, image: 'image'),
    const FavoriteArtist(name: 'Artist2', id: 2, image: 'image'),
  ];
}

FavouriteArtistResponse createTestArtistsResponse() {
  return FavouriteArtistResponse(
      data: [Artists(id: 1, image: 'image', name: 'name')]);
}

Response<FavouriteArtistResponse> createTestResponse(
    FavouriteArtistResponse data) {
  return Response<FavouriteArtistResponse>(
    http.Response('response_body', 200),
    data,
  );
}

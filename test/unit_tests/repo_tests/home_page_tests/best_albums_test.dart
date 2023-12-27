import 'package:audio_player/app/databases/app_database/database.dart';

import 'package:audio_player/app/domain/entity/models.dart';
import 'package:audio_player/app/domain/repositories/index.dart';
import 'package:audio_player/app/domain/services/services.dart';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(createTestAlbumWith1Value());
  });

  group('BestAlbumRepository tests', () {
    late AudioDatabaseMock audioDatabase;
    late AudioPlayerServiceMock audioPlayerServiceMock;
    late BestAlbumRepository bestAlbumRepository;

    setUp(() {
      audioDatabase = AudioDatabaseMock();
      audioPlayerServiceMock = AudioPlayerServiceMock();
      bestAlbumRepository =
          BestAlbumRepository(audioDatabase, audioPlayerServiceMock);
    });

    test('getBestAlbums should return albums from the database', () async {
      // Arrange
      when(() => audioDatabase.getallBestAlbums())
          .thenAnswer((_) => Future.value(createTestAlbum()));

      // Act
      final result = await bestAlbumRepository.getBestAlbums(0, 2);

      // Assert
      expect(result, isNotNull);
      expect(result.length, 2);
      expect(result[0].artist, 'artist');
      verifyNever(() => audioPlayerServiceMock.getBestAlbums(0, 2));
    });

    test('getBestAlbums should return albums from the API (database is empty)',
        () async {
      // Arrange
      final albumsListResponse = createTestAlbumsResponse();
      final response = createTestResponse(albumsListResponse);

      when(() => audioDatabase.getallBestAlbums())
          .thenAnswer((_) => Future.value([]));
      when(() => audioPlayerServiceMock.getBestAlbums(0, 2))
          .thenAnswer((_) => Future.value(response));
      when(() => audioDatabase.addManyAlbums(any()))
          .thenAnswer((_) => Future.value());

      // Act
      final result = await bestAlbumRepository.getBestAlbums(0, 2);

      // Assert
      expect(result, isNotNull);
      expect(result.length, 2);
      expect(result[0].artist, 'artist');
      verify(() => audioPlayerServiceMock.getBestAlbums(0, 2)).called(1);
      verify(() => audioDatabase.addManyAlbums(any())).called(1);
    });

    test('getBestAlbums should return albums from the API', () async {
      // Arrange
      final albumsListResponse = createTestAlbumsResponse();
      final response = createTestResponse(albumsListResponse);

      when(() => audioDatabase.getallBestAlbums())
          .thenAnswer((_) => Future.value(createTestAlbumWith1Value()));
      when(() => audioPlayerServiceMock.getBestAlbums(1, 3))
          .thenAnswer((_) => Future.value(response));
      when(() => audioDatabase.addManyAlbums(any()))
          .thenAnswer((_) => Future.value());

      // Act
      final result = await bestAlbumRepository.getBestAlbums(1, 3);

      // Assert
      expect(result, isNotNull);
      expect(result.length, 2);
      expect(result[0].artist, 'artist');
      verify(() => audioPlayerServiceMock.getBestAlbums(1, 3)).called(1);
      verify(() => audioDatabase.addManyAlbums(any())).called(1);
    });

    test(
        'getBestAlbums should return empty list when both database and API fail',
        () async {
      // Arrange
      when(() => audioDatabase.getallBestAlbums())
          .thenThrow(Exception('Test Error'));
      when(() => audioPlayerServiceMock.getBestAlbums(0, 2))
          .thenThrow(Exception('Test Error'));

      // Act
      final result = await bestAlbumRepository.getBestAlbums(0, 2);

      // Assert
      expect(result, isEmpty);
    });
  });
}

// Helper methods to create test data
List<Album> createTestAlbum() {
  return const [
    Album(
      artist: 'artist',
      // detailAlbum: 1,
      id: 1,
      image: 'image',
      title: 'title',
      type: 'type',
    ),
    Album(
      artist: 'artist',
      // detailAlbum: 2,
      id: 2,
      image: 'image',
      title: 'title',
      type: 'type',
    )
  ];
}

List<Album> createTestAlbumWith1Value() {
  return const [
    Album(
      artist: 'artist',
      // detailAlbum: 1,
      id: 1,
      image: 'image',
      title: 'title',
      type: 'type',
    ),
  ];
}

BestAlbumsResponse createTestAlbumsResponse() {
  return BestAlbumsResponse(data: [
    BestAlbumsList(
      artist: AlbumArtist(name: 'artist', id: 1),
      coverImage: 'image',
      id: 1,
      title: 'title',
      type: 'album',
    ),
    BestAlbumsList(
      artist: AlbumArtist(name: 'artist', id: 2),
      coverImage: 'image',
      id: 2,
      title: 'title',
      type: 'album',
    ),
  ]);
}

Response<BestAlbumsResponse> createTestResponse(BestAlbumsResponse data) {
  return Response<BestAlbumsResponse>(
    http.Response('response_body', 200),
    data,
  );
}

class AudioDatabaseMock extends Mock implements AudioAppDatabase {}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}

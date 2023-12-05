import 'package:audio_player/databases/app_database/database.dart';

import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/repositories/index.dart';
import 'package:audio_player/domain/services/services.dart';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
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
    test('getBestAlbums should return tracks from the database', () async {
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

    test('getBestAlbums should return track from the API', () async {
      // Arrange
      final songsListResponse = createTestAlbumsResponse();
      final response = createTestResponse(songsListResponse);

      when(() => audioDatabase.getallBestAlbums())
          .thenAnswer((_) => Future.value([]));
      when(() => audioPlayerServiceMock.getBestAlbums(0, 2))
          .thenAnswer((_) => Future.value(response));

      // Act
      final result = await bestAlbumRepository.getBestAlbums(0, 2);

      // Assert
      expect(result, isNotNull);
      expect(result.length, 2);
      expect(result[0].artist, 'artist');
      verify(() => audioPlayerServiceMock.getBestAlbums(0, 2)).called(1);
    });

    test('getBestAlbums should return track from the API', () async {
      // Arrange
      final songsListResponse = createTestAlbumsResponse();
      final response = createTestResponse(songsListResponse);

      when(() => audioDatabase.getallBestAlbums())
          .thenAnswer((_) => Future.value(createTestAlbumWith1Value()));
      when(() => audioPlayerServiceMock.getBestAlbums(1, 3))
          .thenAnswer((_) => Future.value(response));

      // Act
      final result = await bestAlbumRepository.getBestAlbums(1, 3);

      // Assert
      expect(result, isNotNull);
      expect(result.length, 2);
      expect(result[0].artist, 'artist');
      verify(() => audioPlayerServiceMock.getBestAlbums(1, 3)).called(1);
    });
    test('getTracks should return emptyList', () async {
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
List<BestAlbum> createTestAlbum() {
  return const [
    BestAlbum(
      artist: 'artist',
      detailAlbum: 1,
      id: 1,
      image: 'image',
      title: 'title',
      type: 'type',
    ),
    BestAlbum(
      artist: 'artist',
      detailAlbum: 2,
      id: 2,
      image: 'image',
      title: 'title',
      type: 'type',
    )
  ];
}

List<BestAlbum> createTestAlbumWith1Value() {
  return const [
    BestAlbum(
      artist: 'artist',
      detailAlbum: 1,
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

class AudioDatabaseMock extends Mock implements AudioAppDatabase {
  @override
  Future<void> addManyAlbums(List<BestAlbum> albums) async {
    return Future<void>.value();
  }
}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}

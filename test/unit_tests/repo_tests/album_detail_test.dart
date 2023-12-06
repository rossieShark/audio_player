import 'dart:async';

import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/repositories/index.dart';
import 'package:audio_player/domain/services/services.dart';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('AlbumDetailsRepository', () {
    late AudioDatabaseMock audioDatabase;
    late AudioPlayerServiceMock audioPlayerServiceMock;
    late AlbumDetailsRepository albumDetailsRepository;

    setUp(() {
      audioDatabase = AudioDatabaseMock();
      audioPlayerServiceMock = AudioPlayerServiceMock();
      albumDetailsRepository =
          AlbumDetailsRepository(audioDatabase, audioPlayerServiceMock);
    });

    test('getDetailAlbums should return album from the database', () async {
      // Arrange
      when(() => audioDatabase.watchInfoInDetailAlbum(1))
          .thenAnswer((_) => Stream.value([createTestDetailAlbums()]));

      // Act
      final result = await albumDetailsRepository.getDetailAlbums('1');

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].type, 'album');

      // Verify that audioPlayerServiceMock.getAlbumSongsList was never called.
      verifyNever(() => audioPlayerServiceMock.getAlbumSongsList('1'));
    });

    test('getDetailAlbums should return album from the API', () async {
      // Arrange
      const albumId = '1';
      final songsListResponse = createTestAlbumDetailResponse();
      final response = createTestResponse(songsListResponse);

      when(() => audioDatabase.watchInfoInDetailAlbum(1))
          .thenAnswer((_) => Stream.value([]));

      when(() => audioPlayerServiceMock.getAlbumSongsList(albumId))
          .thenAnswer((_) => Future.value(response));

      when(() => audioDatabase.addManyDetailAlbums([createTestDetailAlbums()]))
          .thenAnswer((_) => Future<void>.value());

      // Act
      final result = await albumDetailsRepository.getDetailAlbums(albumId);

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].artistNames, 'name');

      // Verify that audioPlayerServiceMock.getAlbumSongsList was called once with the correct parameter.
      verify(() => audioPlayerServiceMock.getAlbumSongsList(albumId)).called(1);
    });

    test('getDetailAlbums should return emptyList', () async {
      // Arrange
      when(() => audioDatabase.watchInfoInDetailAlbum(3))
          .thenThrow(Exception('Test Error'));
      when(() => audioPlayerServiceMock.getAlbumSongsList('3'))
          .thenThrow(Exception('Test Error'));

      // Act
      final result = await albumDetailsRepository.getDetailAlbums('3');

      // Assert
      expect(result, isEmpty);
    });
  });
}

class AudioDatabaseMock extends Mock implements AudioAppDatabase {}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}

// Helper methods to create test data
DetailAlbum createTestDetailAlbums() {
  return const DetailAlbum(
      albumid: 1,
      artistNames: 'name',
      id: 1,
      preview: 'preview',
      title: 'title',
      type: 'album');
}

AlbumDetailsResponse createTestAlbumDetailResponse() {
  return AlbumDetailsResponse(data: [
    AlbumData(
        id: 1,
        title: "title",
        type: "album",
        preview: "preview",
        artist: AlbumDataArtist(name: "name"))
  ]);
}

Response<AlbumDetailsResponse> createTestResponse(AlbumDetailsResponse data) {
  return Response<AlbumDetailsResponse>(
    http.Response('response_body', 200),
    data,
  );
}

import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/domain/entity/recently_played_model/recently_played_model.dart';
import 'package:audio_player/app/domain/repositories/index.dart';
import 'package:audio_player/app/domain/services/services.dart';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('RecentlyPlayedRepository tests', () {
    late AudioDatabaseMock audioDatabase;
    late AudioPlayerServiceMock audioPlayerServiceMock;
    late RecentlyPlayedRepository recentlyPlayedRepository;

    setUp(() {
      audioDatabase = AudioDatabaseMock();
      audioPlayerServiceMock = AudioPlayerServiceMock();
      recentlyPlayedRepository =
          RecentlyPlayedRepository(audioDatabase, audioPlayerServiceMock);
    });

    test('getTracks should return tracks from the database', () async {
      // Arrange
      when(() => audioDatabase.getallRecentlyPlayedSongs())
          .thenAnswer((_) => Future.value(createSongsFromDb()));

      // Act
      final result = await recentlyPlayedRepository.getTracks();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].artistNames, 'name');
      verifyNever(() => audioPlayerServiceMock.getRecentlyPlayedTracks());
    });

    test('getTracks should return track from the API', () async {
      // Arrange
      final recentlyPlayedResponse = createTestResentlyPlayedResponse();
      final response = createTestResponse(recentlyPlayedResponse);

      when(() => audioDatabase.getallRecentlyPlayedSongs())
          .thenAnswer((_) => Future.value([]));

      when(() => audioPlayerServiceMock.getRecentlyPlayedTracks())
          .thenAnswer((_) => Future.value(response));
      when(() => audioDatabase.addManySongs(createSongsFromDb()))
          .thenAnswer((_) => Future<void>.value());

      // Act
      final result = await recentlyPlayedRepository.getTracks();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].artistNames, 'name');
      verify(() => audioPlayerServiceMock.getRecentlyPlayedTracks()).called(1);
    });

    test('getTracks should return empty list when database and API fail',
        () async {
      // Arrange
      when(() => audioDatabase.getallRecentlyPlayedSongs())
          .thenThrow(Exception('Test Error'));
      when(() => audioPlayerServiceMock.getRecentlyPlayedTracks())
          .thenThrow(Exception('Test Error'));

      // Act
      final result = await recentlyPlayedRepository.getTracks();

      // Assert
      expect(result, isEmpty);
    });
  });
}

class AudioDatabaseMock extends Mock implements AudioAppDatabase {}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}

// Helper methods to create test data
RecentlyPlayedResponse createTestResentlyPlayedResponse() {
  return RecentlyPlayedResponse(
      tracks: Tracks(data: [
    TracksData(
        title: 'title',
        artist: Artist(id: 1, image: 'image', name: 'name'),
        id: 1,
        preview: 'preview',
        type: 'type')
  ]));
}

Response<RecentlyPlayedResponse> createTestResponse(
    RecentlyPlayedResponse data) {
  return Response<RecentlyPlayedResponse>(
    http.Response('response_body', 200),
    data,
  );
}

List<RecentlyPlayedSong> createSongsFromDb() {
  return [
    const RecentlyPlayedSong(
        title: 'title',
        artistNames: 'name',
        id: 1,
        preview: 'preview',
        type: 'type',
        headerImageUrl: 'image')
  ];
}

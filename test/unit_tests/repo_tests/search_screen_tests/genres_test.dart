import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/domain/entity/genres_model/genres_model.dart';
import 'package:audio_player/app/domain/repositories/genres_repository/genres_repository.dart';
import 'package:audio_player/app/domain/services/services.dart';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(createTestGenres());
  });

  group('RecentlyPlayedRepository tests', () {
    late AudioDatabaseMock audioDatabase;
    late AudioPlayerServiceMock audioPlayerServiceMock;
    late GenresRepository genresRepository;

    setUp(() {
      audioDatabase = AudioDatabaseMock();
      audioPlayerServiceMock = AudioPlayerServiceMock();
      genresRepository =
          GenresRepository(audioDatabase, audioPlayerServiceMock);
    });

    test('getAllGenres should return genres from the database', () async {
      // Arrange
      when(() => audioDatabase.getallGenres())
          .thenAnswer((_) => Future.value(createTestGenres()));

      // Act
      final result = await genresRepository.getAllGenres();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].name, 'pop');
      verifyNever(() => audioPlayerServiceMock.getGenres());
    });

    test('getAllGenres should return genres from the API', () async {
      // Arrange
      final genresListResponse = createTestGenresResponse();
      final response = createTestResponse(genresListResponse);

      when(() => audioDatabase.getallGenres())
          .thenAnswer((_) => Future.value([]));

      when(() => audioPlayerServiceMock.getGenres())
          .thenAnswer((_) => Future.value(response));

      // Act
      final result = await genresRepository.getAllGenres();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].name, 'rock');
      verify(() => audioPlayerServiceMock.getGenres()).called(1);
    });

    test('getAllGenres should return empty list when database and API fail',
        () async {
      // Arrange
      when(() => audioDatabase.getallGenres())
          .thenThrow(Exception('Test Error'));
      when(() => audioPlayerServiceMock.getGenres())
          .thenThrow(Exception('Test Error'));
      when(() => audioDatabase.addManyAlbums(any()))
          .thenAnswer((_) => Future.value());

      // Act
      final result = await genresRepository.getAllGenres();

      // Assert
      expect(result, isEmpty);
    });
  });
}

class AudioDatabaseMock extends Mock implements AudioAppDatabase {
  @override
  Future<void> addManyGenres(List<MusicGenre> genres) async {
    return Future<void>.value();
  }
}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}

// Helper methods to create test data
List<MusicGenre> createTestGenres() {
  return const [MusicGenre(id: '1', image: 'image', name: 'pop')];
}

GenresResponse createTestGenresResponse() {
  return GenresResponse(data: [Data(id: 1, image: 'image', name: 'rock')]);
}

Response<GenresResponse> createTestResponse(GenresResponse data) {
  return Response<GenresResponse>(
    http.Response('response_body', 200),
    data,
  );
}

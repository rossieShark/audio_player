import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/repositories/index.dart';
import 'package:audio_player/domain/services/services.dart';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  // final searchPaginationService =
  //     SearchResultPaginationService(searchRepository);

  group('getSearchResults', () {
    late AudioPlayerServiceMock audioPlayerServiceMock;
    late SearchResultRepository searchRepository;
    setUp(() {
      audioPlayerServiceMock = AudioPlayerServiceMock();
      searchRepository = SearchResultRepository(audioPlayerServiceMock);
    });
    test('should return a list of AllSearchResult from API', () async {
      // Arrange

      final tracksResponse = createTestSearchResponse();
      final response = createTestResponse(tracksResponse);

      when(() => audioPlayerServiceMock.getSearchResult('Joji', 0, 1))
          .thenAnswer((_) => Future.value(response));
      //act
      final result =
          await searchRepository.getSearchResult(0, 1, 'Joji', 'All');
      print(result);
      //assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].artist.name, 'Joji');

      verify(() => audioPlayerServiceMock.getSearchResult('Joji', 0, 1))
          .called(1);
      verifyNever(
          () => audioPlayerServiceMock.getSearchAlbumResult('Joji', 0, 1));
      verifyNever(
          () => audioPlayerServiceMock.getSearchTrackResult('Joji', 0, 1));
    });

    test('should return a list of AllSearchResult from API', () async {
      // Arrange

      final tracksResponse = createTestSearchResponse();
      final response = createTestResponse(tracksResponse);

      when(() => audioPlayerServiceMock.getSearchResult('Joji', 0, 1))
          .thenAnswer((_) => Future.value(response));
      //act
      final result =
          await searchRepository.getSearchResult(0, 1, 'Joji', 'All');
      print(result);
      //assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].artist.name, 'Joji');

      verify(() => audioPlayerServiceMock.getSearchResult('Joji', 0, 1))
          .called(1);
      verifyNever(
          () => audioPlayerServiceMock.getSearchAlbumResult('Joji', 0, 1));
      verifyNever(
          () => audioPlayerServiceMock.getSearchTrackResult('Joji', 0, 1));
    });

    test('should return a list of AllSearchResult from API', () async {
      // Arrange

      final tracksResponse = createTestSearchResponse();
      final response = createTestResponse(tracksResponse);

      when(() => audioPlayerServiceMock.getSearchTrackResult('Joji', 0, 1))
          .thenAnswer((_) => Future.value(response));
      //act
      final result =
          await searchRepository.getSearchResult(0, 1, 'Joji', 'track');
      print(result);
      //assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].artist.name, 'Joji');

      verify(() => audioPlayerServiceMock.getSearchTrackResult('Joji', 0, 1))
          .called(1);
      verifyNever(
          () => audioPlayerServiceMock.getSearchAlbumResult('Joji', 0, 1));
      verifyNever(() => audioPlayerServiceMock.getSearchResult('Joji', 0, 1));
    });

    test('should return a list of AllSearchResult from API', () async {
      // Arrange

      final tracksResponse = createTestAlbumsResponse();
      final response = createAlbumsResponse(tracksResponse);

      when(() => audioPlayerServiceMock.getSearchAlbumResult('Joji', 0, 1))
          .thenAnswer((_) => Future.value(response));
      //act
      final result =
          await searchRepository.getSearchResult(0, 1, 'Joji', 'album');
      print(result);
      //assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].artist.name, 'Joji');

      verify(() => audioPlayerServiceMock.getSearchAlbumResult('Joji', 0, 1))
          .called(1);
      verifyNever(
          () => audioPlayerServiceMock.getSearchTrackResult('Joji', 0, 1));
      verifyNever(() => audioPlayerServiceMock.getSearchResult('Joji', 0, 1));
    });
  });

  group('SearchResultPaginationService', () {
    late AudioPlayerServiceMock audioPlayerServiceMock;
    late SearchResultRepository searchRepository;
    late SearchResultPaginationService searchPaginationService;
    setUp(() {
      audioPlayerServiceMock = AudioPlayerServiceMock();
      searchRepository = SearchResultRepository(audioPlayerServiceMock);
      searchPaginationService = SearchResultPaginationService(searchRepository);
    });
    test('should load more items', () async {
      // Arrange
      final tracksResponse = createTestSearchResponse();
      final response = createTestResponse(tracksResponse);

      when(() => audioPlayerServiceMock.getSearchResult(
            'Joji',
            0,
            10,
          )).thenAnswer((_) => Future.value(response));

      // Act
      await searchPaginationService.loadMoreItems('Joji', 'All');

      // Assert
      expect(searchPaginationService.items, isNotEmpty);
      expect(searchPaginationService.items.length, 1);
      expect(searchPaginationService.items[0].artist.name, 'Joji');
      expect(searchPaginationService.isLoading, false);
    });

    test('should clear items when search query is empty', () async {
      // Arrange
      searchPaginationService.items.add(SearchData(
        title: 'Sanctuary',
        artist: SearchDataArtist(image: "image", name: "Joji"),
        id: 1,
        preview: "preview",
        type: "type",
      ));

      // Act
      await searchPaginationService.loadMoreItems('', 'All');

      // Assert
      expect(searchPaginationService.items, isEmpty);
      expect(searchPaginationService.isLoading, false);
    });
  });
}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}

// Helper methods to create test data

SearchResultResponce createTestSearchResponse() {
  return SearchResultResponce(data: [
    SearchData(
        title: 'Sanctuary',
        artist: SearchDataArtist(image: "image", name: "Joji"),
        id: 1,
        preview: "preview",
        type: "type"),
  ]);
}

Response<SearchResultResponce> createTestResponse(SearchResultResponce data) {
  return Response<SearchResultResponce>(
    http.Response('response_body', 200),
    data,
  );
}

BestAlbumsResponse createTestAlbumsResponse() {
  return BestAlbumsResponse(data: [
    BestAlbumsList(
      artist: AlbumArtist(name: 'Joji', id: 1),
      coverImage: 'image',
      id: 1,
      title: 'title',
      type: 'album',
    ),
  ]);
}

Response<BestAlbumsResponse> createAlbumsResponse(BestAlbumsResponse data) {
  return Response<BestAlbumsResponse>(
    http.Response('response_body', 200),
    data,
  );
}

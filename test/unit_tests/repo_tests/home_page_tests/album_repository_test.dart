import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/domain/repositories/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final bestAlbumRepository = MockBestAlbumRepository();
  final service = BestAlbumsPaginationService(bestAlbumRepository);

  group('AlbumRepository', () {
    test('getAlbums should return a list of BestAlbums', () async {
      // Define a mock response for getBestAlbums method
      when(() => bestAlbumRepository.getBestAlbums(any(), any())).thenAnswer(
        (_) async => _createTestList(),
      );

      final albums = await bestAlbumRepository.getBestAlbums(0, 1);

      expect(albums, isNotEmpty);
      expect(albums.length, 2);
      expect(albums, isA<List<Album>>());
      expect(albums[0].id, 1);
      expect(albums[1].title, 'title');
    });
  });

  group('BestAlbumsPaginationService', () {
    test('loadMoreItems should load more albums', () async {
      when(() => bestAlbumRepository.getBestAlbums(any(), any())).thenAnswer(
        (_) async => _createTestList(),
      );

      await service.loadMoreItems();

      expect(service.items, isNotEmpty);
      expect(service.isLoading, false);
      expect(service.items, isA<List<Album>>());
      expect(service.items.length, 2);
    });
  });
}

class MockBestAlbumRepository extends Mock implements BestAlbumRepository {}

List<Album> _createTestList() {
  return [
    const Album(
        id: 1,
        artist: 'artist',
        // detailAlbum: 1,
        image: 'image',
        title: 'title',
        type: 'album'),
    const Album(
        id: 2,
        artist: 'artist',
        // detailAlbum: 2,
        image: 'image',
        title: 'title',
        type: 'album'),
  ];
}

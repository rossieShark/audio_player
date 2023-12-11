import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/repositories/index.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockAlbumRepository extends Mock implements AlbumRepository {}

class MockBestAlbumsPaginationService extends Mock
    implements BestAlbumsPaginationService {}

void main() {
  group('AlbumBloc', () {
    late AlbumBloc albumBloc;
    late MockAlbumRepository repository;

    setUp(() {
      repository = MockAlbumRepository();
      albumBloc = AlbumBloc(repository);
    });

    blocTest<AlbumBloc, AlbumBlocState>(
        'emits LoadedAlbumBlocState when FetchAlbumsEvent is added',
        build: () {
          when(() => repository.getAlbums())
              .thenAnswer((_) async => createTestAlbums());
          return albumBloc;
        },
        act: (bloc) => bloc.add(FetchAlbumsEvent()),
        expect: () => [
              isA<LoadedAlbumBlocState>(),
            ]);

    blocTest<AlbumBloc, AlbumBlocState>(
        'emits LoadingAlbumBlocState when FetchAlbumsEvent is added with empty result',
        build: () {
          when(() => repository.getAlbums()).thenAnswer((_) async => []);
          return albumBloc;
        },
        act: (bloc) => bloc.add(FetchAlbumsEvent()),
        expect: () => [
              isA<LoadingAlbumBlocState>(),
            ]);

    blocTest<AlbumBloc, AlbumBlocState>(
      'emits ErrorAlbumBlocState when FetchAlbumsEvent throws an exception',
      build: () {
        when(() => repository.getAlbums()).thenThrow(Exception());
        return albumBloc;
      },
      act: (bloc) => bloc.add(FetchAlbumsEvent()),
      expect: () => [
        isA<ErrorAlbumBlocState>(),
      ],
    );
  });

  group('AlbumRepository', () {
    test('getAlbums should return a list of BestAlbums', () async {
      final service = MockBestAlbumsPaginationService();
      // Arrange
      when(() => service.loadMoreItems()).thenAnswer((_) async {});
      when(() => service.items).thenReturn(createTestAlbums());
      final repository = AlbumRepository(service);

      // Act
      final albums = await repository.getAlbums();

      // Assert
      expect(albums, isNotEmpty);
      expect(albums, isA<List<BestAlbum>>());
    });
  });
}

List<BestAlbum> createTestAlbums() {
  return const [
    BestAlbum(
        id: 1,
        artist: 'artist',
        // detailAlbum: 1,
        image: 'image',
        title: 'title',
        type: 'album'),
    BestAlbum(
        id: 2,
        artist: 'artist',
        // detailAlbum: 2,
        image: 'image',
        title: 'title',
        type: 'album')
  ];
}

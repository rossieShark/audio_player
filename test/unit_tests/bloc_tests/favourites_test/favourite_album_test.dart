import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/repositories/favourites_repository.dart/favourite_album_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFavouriteAlbumRepository extends Mock
    implements FavouriteAlbumRepository {}

void main() {
  late FavoriteAlbumBloc favoriteBloc;
  late MockFavouriteAlbumRepository repository;

  setUp(() {
    repository = MockFavouriteAlbumRepository();
    favoriteBloc = FavoriteAlbumBloc(repository);
  });

  tearDown(() {
    favoriteBloc.close();
  });

  group('FavoriteSongBloc', () {
    final songModelToAdd = SongModel(
        artistNames: 'A',
        id: '1',
        image: 'image',
        preview: '',
        title: 'title',
        type: 'type',
        isFavourite: true);

    final existingSongModel = SongModel(
        artistNames: 'B',
        id: '2',
        image: 'image2',
        preview: '',
        title: 'title2',
        type: 'type2',
        isFavourite: false);

    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'emits LoadedFavoriteAlbumState when LoadFavoriteAlbumEvent is added',
      build: () {
        when(() => repository.loadAlbums())
            .thenAnswer((_) async => [songModelToAdd]);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(const LoadFavoriteAlbumEvent()),
      expect: () => [
        isA<LoadedFavoriteAlbumState>().having(
          (state) => state.data,
          'favouriteAlbumBloc',
          contains(songModelToAdd),
        ),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadAlbums()).called(1);
      },
    );

    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'emits NoResultsFavouriteAlbumState when LoadFavoriteAlbumEvent is added',
      build: () {
        when(() => repository.loadAlbums()).thenAnswer((_) async => []);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(const LoadFavoriteAlbumEvent()),
      expect: () => [
        isA<NoResultsFavoriteAlbumState>(),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadAlbums()).called(1);
      },
    );
    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'emits LoadedFavouriteAlbumState when AddAlbumEvent is added ',
      build: () {
        when(() => repository.loadAlbums())
            .thenAnswer((_) async => [existingSongModel]);
        when(() => repository.addToFavoritesAlbum(songModelToAdd))
            .thenAnswer((_) async => Future<void>);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(AddAlbumEvent(songModelToAdd)),
      expect: () => [
        isA<LoadedFavoriteAlbumState>().having(
          (state) => state.data,
          'favouriteAlbumBloc',
          [existingSongModel, songModelToAdd],
        ),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadAlbums()).called(1);
        // Verify that addToRecentlySearched was called
        verify(() => repository.addToFavoritesAlbum(songModelToAdd)).called(1);
      },
    );

    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'emits LoadedFavouriteAlbumState when RemoveAlbumsEvent is added ',
      build: () {
        when(() => repository.loadAlbums())
            .thenAnswer((_) async => [existingSongModel, songModelToAdd]);
        when(() => repository.removeFromFavoritesAlbum(songModelToAdd))
            .thenAnswer((_) async => Future<void>);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(RemoveAlbumsEvent(songModelToAdd)),
      expect: () => [
        isA<LoadedFavoriteAlbumState>().having(
          (state) => state.data,
          'favouriteAlbumBloc',
          [existingSongModel],
        ),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadAlbums()).called(1);
        // Verify that addToRecentlySearched was called
        verify(() => repository.removeFromFavoritesAlbum(songModelToAdd))
            .called(1);
      },
    );

    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'emits NoResults when RemoveAlbumsEvent is added ',
      build: () {
        when(() => repository.loadAlbums())
            .thenAnswer((_) async => [songModelToAdd]);
        when(() => repository.removeFromFavoritesAlbum(songModelToAdd))
            .thenAnswer((_) async => Future<void>);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(RemoveAlbumsEvent(songModelToAdd)),
      expect: () => [isA<NoResultsFavoriteAlbumState>()],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadAlbums()).called(1);
        // Verify that addToRecentlySearched was called
        verify(() => repository.removeFromFavoritesAlbum(songModelToAdd))
            .called(1);
      },
    );

    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'emits the correct states when ToggleIsFavouriteAlbum event is added',
      build: () {
        when(() => repository.loadAlbums())
            .thenAnswer((_) async => [songModelToAdd]);
        when(() => repository.removeFromFavoritesAlbum(songModelToAdd))
            .thenAnswer((_) async => Future<void>);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(ToggleIsFavouriteAlbum(album: songModelToAdd)),
      expect: () => [
        isA<NoResultsFavoriteAlbumState>(),
      ],
      verify: (_) {
        verify(() => repository.removeFromFavoritesAlbum(songModelToAdd))
            .called(1);
        verifyNever(() => repository.addToFavoritesAlbum(songModelToAdd))
            .called(0);
      },
    );

    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'emits the correct states when ToggleIsFavouriteAlbum event is added',
      build: () {
        when(() => repository.loadAlbums())
            .thenAnswer((_) async => [songModelToAdd]);
        when(() => repository.addToFavoritesAlbum(existingSongModel))
            .thenAnswer((_) async => Future<void>);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(ToggleIsFavouriteAlbum(album: existingSongModel)),
      expect: () => [
        isA<LoadedFavoriteAlbumState>().having(
          (state) => state.data,
          'favouriteAlbumBloc',
          [songModelToAdd, existingSongModel],
        ),
      ],
      verify: (_) {
        verify(() => repository.addToFavoritesAlbum(existingSongModel))
            .called(1);
        verifyNever(
                () => repository.removeFromFavoritesAlbum(existingSongModel))
            .called(0);
        // Add additional verifications based on your expected behavior
      },
    );

    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'return sortedList when SortAlbumsEvent event is added',
      build: () {
        when(() => repository.loadAlbums())
            .thenAnswer((_) async => [existingSongModel, songModelToAdd]);

        return favoriteBloc;
      },
      act: (bloc) => bloc.add(const SortAlbumsEvent()),
      expect: () => [
        isA<LoadedFavoriteAlbumState>().having(
          (state) => state.data,
          'favouriteAlbumBloc',
          [songModelToAdd, existingSongModel],
        ),
      ],
      verify: (_) {
        verify(() => repository.loadAlbums()).called(1);
      },
    );
  });
}

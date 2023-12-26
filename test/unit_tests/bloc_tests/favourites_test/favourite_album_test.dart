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

  group('FavoriteAlbumBloc', () {
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
        when(() => repository.loadFavourites())
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
        // Verify that loadAlbums was called
        verify(() => repository.loadFavourites()).called(1);
      },
    );

    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'emits NoResultsFavouriteAlbumState when LoadFavoriteAlbumEvent is added',
      build: () {
        when(() => repository.loadFavourites()).thenAnswer((_) async => []);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(const LoadFavoriteAlbumEvent()),
      expect: () => [
        isA<NoResultsFavoriteAlbumState>(),
      ],
      verify: (_) {
        // Verify that loadAlbums was called
        verify(() => repository.loadFavourites()).called(1);
      },
    );
    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'emits LoadedFavouriteAlbumState when AddAlbumEvent is added ',
      build: () {
        when(() => repository.loadFavourites())
            .thenAnswer((_) async => [existingSongModel]);
        when(() => repository.addToFavorites(songModelToAdd))
            .thenAnswer((_) async => [existingSongModel, songModelToAdd]);
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
        // Verify that addToFavoritesAlbum was called
        verify(() => repository.addToFavorites(songModelToAdd)).called(1);
      },
    );

    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'emits LoadedFavouriteAlbumState when RemoveAlbumsEvent is added ',
      build: () {
        when(() => repository.loadFavourites())
            .thenAnswer((_) async => [existingSongModel, songModelToAdd]);
        when(() => repository.removeFromFavorites(songModelToAdd))
            .thenAnswer((_) async => [existingSongModel]);
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
        // Verify that removeFromFavoritesAlbum was called
        verify(() => repository.removeFromFavorites(songModelToAdd)).called(1);
      },
    );

    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'emits NoResults when RemoveAlbumsEvent is added ',
      build: () {
        when(() => repository.loadFavourites())
            .thenAnswer((_) async => [songModelToAdd]);
        when(() => repository.removeFromFavorites(songModelToAdd))
            .thenAnswer((_) async => []);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(RemoveAlbumsEvent(songModelToAdd)),
      expect: () => [isA<NoResultsFavoriteAlbumState>()],
      verify: (_) {
        // Verify that removeFromFavoritesAlbum was called
        verify(() => repository.removeFromFavorites(songModelToAdd)).called(1);
      },
    );

    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'emits the correct states when ToggleIsFavouriteAlbum event is added',
      build: () {
        when(() => repository.isFavourite(songModelToAdd.id))
            .thenAnswer((_) async => true);
        when(() => repository.removeFromFavorites(songModelToAdd))
            .thenAnswer((_) async => []);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(ToggleIsFavouriteAlbum(album: songModelToAdd)),
      expect: () => [
        isA<NoResultsFavoriteAlbumState>(),
      ],
      verify: (_) {
        verify(() => repository.removeFromFavorites(songModelToAdd)).called(1);
        verifyNever(() => repository.addToFavorites(songModelToAdd)).called(0);
      },
    );

    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'emits the correct states when ToggleIsFavouriteAlbum event is added',
      build: () {
        when(() => repository.isFavourite(existingSongModel.id))
            .thenAnswer((_) async => false);
        when(() => repository.addToFavorites(existingSongModel))
            .thenAnswer((_) async => [existingSongModel]);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(ToggleIsFavouriteAlbum(album: existingSongModel)),
      expect: () => [
        isA<LoadedFavoriteAlbumState>().having(
          (state) => state.data,
          'favouriteAlbumBloc',
          [existingSongModel],
        ),
      ],
      verify: (_) {
        verify(() => repository.addToFavorites(existingSongModel)).called(1);
        verifyNever(() => repository.removeFromFavorites(existingSongModel))
            .called(0);
      },
    );

    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'return sortedList when SortAlbumsEvent event is added',
      build: () {
        when(() => repository.loadFavourites())
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
        verify(() => repository.loadFavourites()).called(1);
      },
    );
    blocTest<FavoriteAlbumBloc, FavoriteAlbumState>(
      'return sortedList when SortSongsEvent event is added',
      build: () {
        when(() => repository.loadFavourites())
            .thenAnswer((_) async => [existingSongModel, songModelToAdd]);

        return favoriteBloc;
      },
      act: (bloc) => bloc.add(const SortAlbumsEvent()),
      expect: () => [
        // Check if sorting is applied
        if (favoriteBloc.isSorted)
          isA<LoadedFavoriteAlbumState>().having(
            (state) => state.data,
            'favouriteSongBloc',
            [songModelToAdd, existingSongModel],
          ),
      ],
      verify: (_) {
        verify(() => repository.loadFavourites()).called(1);
      },
    );
  });
}

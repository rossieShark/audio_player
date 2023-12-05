import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/repositories/recently_searched_repository/recently_searched_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecentlySearchedRepository extends Mock
    implements RecentlySearchedRepository {}

void main() {
  late RecentlySearchedBloc recentlySearchedBloc;
  late MockRecentlySearchedRepository repository;

  setUp(() {
    repository = MockRecentlySearchedRepository();
    recentlySearchedBloc = RecentlySearchedBloc(repository);
  });

  tearDown(() {
    recentlySearchedBloc.close();
  });

  group('RecentlySearchedBloc', () {
    final songModelToAdd = SongModel(
        artistNames: 'name',
        id: '1',
        image: 'image',
        preview: 'preview',
        title: 'title',
        type: 'type',
        isFavourite: false);

    final existingSongModel = SongModel(
        artistNames: 'name2',
        id: '2',
        image: 'image2',
        preview: 'preview2',
        title: 'title2',
        type: 'type2',
        isFavourite: false);

    blocTest<RecentlySearchedBloc, RecentlySearchedState>(
      'emits LoadedRecentlySearchedState when LoadRecentlySearchedEvent is added',
      build: () {
        when(() => repository.loadFromDatabase())
            .thenAnswer((_) async => [songModelToAdd]);
        return recentlySearchedBloc;
      },
      act: (bloc) => bloc.add(const LoadRecentlySearchedEvent()),
      expect: () => [
        isA<LoadedRecentlySearchedState>().having(
          (state) => state.data,
          'recentlySearched',
          contains(songModelToAdd),
        ),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadFromDatabase()).called(1);
      },
    );

    blocTest<RecentlySearchedBloc, RecentlySearchedState>(
      'emits EmptyRecentlySearchedState when LoadRecentlySearchedEvent is added',
      build: () {
        when(() => repository.loadFromDatabase()).thenAnswer((_) async => []);
        return recentlySearchedBloc;
      },
      act: (bloc) => bloc.add(const LoadRecentlySearchedEvent()),
      expect: () => [
        isA<EmptyRecentlySearchedState>(),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadFromDatabase()).called(1);
      },
    );

    blocTest<RecentlySearchedBloc, RecentlySearchedState>(
      'emits LoadedRecentlySearchedState when AddToRecentlySearchedEvent is added with existing data',
      build: () {
        when(() => repository.loadFromDatabase())
            .thenAnswer((_) async => [existingSongModel]);
        when(() => repository.addToRecentlySearched(songModelToAdd))
            .thenAnswer((_) async => Future<void>);
        return recentlySearchedBloc;
      },
      act: (bloc) => bloc.add(AddToRecentlySearchedEvent(songModelToAdd)),
      expect: () => [
        isA<LoadedRecentlySearchedState>().having(
          (state) => state.data,
          'recentlySearched',
          [existingSongModel, songModelToAdd],
        ),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadFromDatabase()).called(1);
        // Verify that addToRecentlySearched was called
        verify(() => repository.addToRecentlySearched(songModelToAdd))
            .called(1);
      },
    );
    blocTest<RecentlySearchedBloc, RecentlySearchedState>(
      'emits LoadedRecentlySearchedState when AddToRecentlySearchedEvent is added with existing equal data',
      build: () {
        when(() => repository.loadFromDatabase())
            .thenAnswer((_) async => [existingSongModel]);
        when(() => repository.addToRecentlySearched(existingSongModel))
            .thenAnswer((_) async => Future<void>);
        return recentlySearchedBloc;
      },
      act: (bloc) => bloc.add(AddToRecentlySearchedEvent(existingSongModel)),
      expect: () => [
        isA<LoadedRecentlySearchedState>().having(
          (state) => state.data,
          'recentlySearched',
          [existingSongModel],
        ),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadFromDatabase()).called(1);
        // Verify that loadFromDatabase was never called
        verifyNever(() => repository.addToRecentlySearched(existingSongModel));
      },
    );

    blocTest<RecentlySearchedBloc, RecentlySearchedState>(
      'emits EmptyRecentlySearchedState when RemoveFromRecentlySearchedEvent is added',
      build: () {
        when(() => repository.loadFromDatabase())
            .thenAnswer((_) async => [existingSongModel]);
        when(() => repository.removeFromRecentlySearched(existingSongModel))
            .thenAnswer((_) async => Future<void>);
        return recentlySearchedBloc;
      },
      act: (bloc) =>
          bloc.add(RemoveFromRecentlySearchedEvent(existingSongModel)),
      expect: () => [isA<EmptyRecentlySearchedState>()],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadFromDatabase()).called(1);
        // Verify that removeFromRecentlySearched was called
        verify(() => repository.removeFromRecentlySearched(existingSongModel))
            .called(1);
      },
    );

    blocTest<RecentlySearchedBloc, RecentlySearchedState>(
      'emits LoadedRecentlySearchedState when RemoveFromRecentlySearchedEvent is added',
      build: () {
        when(() => repository.loadFromDatabase())
            .thenAnswer((_) async => [existingSongModel, songModelToAdd]);
        when(() => repository.removeFromRecentlySearched(existingSongModel))
            .thenAnswer((_) async => Future<void>);
        return recentlySearchedBloc;
      },
      act: (bloc) =>
          bloc.add(RemoveFromRecentlySearchedEvent(existingSongModel)),
      expect: () => [
        isA<LoadedRecentlySearchedState>().having(
          (state) => state.data,
          'recentlySearched',
          [songModelToAdd],
        ),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadFromDatabase()).called(1);
        // Verify that removeFromRecentlySearched was called
        verify(() => repository.removeFromRecentlySearched(existingSongModel))
            .called(1);
      },
    );

    blocTest<RecentlySearchedBloc, RecentlySearchedState>(
      'emits EmptyRecentlySearchedState when RemoveAllEvent is added',
      build: () {
        when(() => repository.removeAllRecentlySearched())
            .thenAnswer((_) async => Future<void>);
        return recentlySearchedBloc;
      },
      act: (bloc) => bloc.add(const RemoveAllEvent()),
      expect: () => [isA<EmptyRecentlySearchedState>()],
      verify: (_) {
        // Verify that removeAllRecentlySearched was called
        verify(() => repository.removeAllRecentlySearched()).called(1);
      },
    );
  });
}

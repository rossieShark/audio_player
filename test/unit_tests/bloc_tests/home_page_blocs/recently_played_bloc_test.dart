import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/domain/repositories/index.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecentlyPlayedRepository extends Mock
    implements RecentlyPlayedRepository {}

void main() {
  group('RecentlyPlayedBloc', () {
    late RecentlyPlayedBloc recentlyPlayedBloc;
    late MockRecentlyPlayedRepository repository;

    setUp(() {
      repository = MockRecentlyPlayedRepository();
      recentlyPlayedBloc = RecentlyPlayedBloc(repository);
    });

    blocTest<RecentlyPlayedBloc, RecentlyPlayedState>(
      'emits LoadedRecentlyPlayedState when FetchRecentlyPlayedEvent is added',
      build: () {
        // Mock the scenario where getTracksFromDb returns non-empty data
        when(() => repository.getTracks()).thenAnswer((_) async => [
              const RecentlyPlayedSong(
                  artistNames: 'artist',
                  headerImageUrl: 'image',
                  id: 1,
                  preview: 'preview',
                  title: 'track1',
                  type: 'track'),
            ]);
        return recentlyPlayedBloc;
      },
      act: (bloc) => bloc.add(FetchRecentlyPlayedEvent()),
      expect: () => [
        // Check that the bloc emits a FavoriteArtistState with data from getTracksFromDb
        isA<LoadedRecentlyPlayedState>().having(
          (state) => state.data,
          'recentlyPlayed',
          contains(
            const RecentlyPlayedSong(
                artistNames: 'artist',
                headerImageUrl: 'image',
                id: 1,
                preview: 'preview',
                title: 'track1',
                type: 'track'),
          ),
        ),
      ],
    );

    blocTest<RecentlyPlayedBloc, RecentlyPlayedState>(
      'emits LoadingRecentlyPlayedState when FetchRecentlyPlayedEvent is added with empty tracks',
      build: () {
        // Mock the scenario where getTracksFromDb returns an empty list
        when(() => repository.getTracks()).thenAnswer((_) async => []);
        return recentlyPlayedBloc;
      },
      act: (bloc) => bloc.add(FetchRecentlyPlayedEvent()),
      expect: () => [
        // Check that the bloc emits a FavoriteArtistState with data from getFavoriteArtists
        isA<LoadingRecentlyPlayedState>()
      ],
    );

    blocTest<RecentlyPlayedBloc, RecentlyPlayedState>(
      'emits ErrorRecentlyPlayedState when FetchRecentlyPlayedEvent throws an exception',
      build: () {
        when(() => repository.getTracks()).thenThrow(Exception());
        return recentlyPlayedBloc;
      },
      act: (bloc) => bloc.add(FetchRecentlyPlayedEvent()),
      expect: () => [
        isA<ErrorRecentlyPlayedState>(),
      ],
    );
  });
}

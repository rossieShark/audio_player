import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/ui/widgets/screens/search_screen/bloc_empty_state/web/bloc_empty_state.dart';
import 'package:audio_player/ui/widgets/screens/search_screen/bloc_empty_state/web/genres_section/create_genres_section.dart';
import 'package:audio_player/ui/widgets/screens/search_screen/bloc_empty_state/web/recently_searched_section/create_recently_searched_section.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../home_screen/golden_image.dart';
import '../testable_widget_sample.dart';

class MockMusicBloc extends MockBloc<MusicEvent, MusicState>
    implements MusicBloc {}

class MockRecentlySearchedBloc
    extends MockBloc<RecentlySearchedEvent, RecentlySearchedState>
    implements RecentlySearchedBloc {}

class MockGenresBloc extends MockBloc<GenresEvent, GenresBlocState>
    implements GenresBloc {}

void main() {
  group('CreateBlocEmptyState Widget Tests', () {
    late MockRecentlySearchedBloc recentlySearchedBloc;
    late MockGenresBloc genresBloc;
    late String image;
    setUp(() {
      recentlySearchedBloc = MockRecentlySearchedBloc();
      genresBloc = MockGenresBloc();
      image = returnTestImage();
    });
    testWidgets('renders loading state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loading state
      when(() => recentlySearchedBloc.state)
          .thenReturn(const LoadingRecentlySearchedState());

      whenListen<RecentlySearchedState>(
        recentlySearchedBloc,
        Stream<RecentlySearchedState>.fromIterable([
          const LoadingRecentlySearchedState(),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<RecentlySearchedBloc>(
                create: (context) => recentlySearchedBloc,
              ),
            ],
            child: TestableWidget()
                .makeTestableWidget(child: const CreateBlocEmptyState()),
          ),
        ),
      );
      await tester.pump(Duration.zero);
      // Verify that the Loading state is rendered
      expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);
      expect(find.byType(CreateGenresSection), findsNothing);
    });

    testWidgets('renders empty state with error GenresBlocState',
        (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Empty state
      when(() => recentlySearchedBloc.state)
          .thenReturn(const EmptyRecentlySearchedState());
      // Stub the behavior of the bloc to emit Genres Error state
      when(() => genresBloc.state).thenReturn(const ErrorGenresBlocState());

      whenListen<RecentlySearchedState>(
        recentlySearchedBloc,
        Stream<RecentlySearchedState>.fromIterable([
          const EmptyRecentlySearchedState(),
        ]),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<RecentlySearchedBloc>(
                create: (context) => recentlySearchedBloc,
              ),
              BlocProvider<GenresBloc>(
                create: (context) => genresBloc,
              ),
            ],
            child: TestableWidget()
                .makeTestableWidget(child: const CreateBlocEmptyState()),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Error state is rendered
      expect(find.byType(CreateGenresSection), findsOneWidget);
      expect(find.byType(NoResultsWidget), findsOneWidget);
    });

    testWidgets('renders empty state with loading GenresBlocState',
        (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Empty state
      when(() => recentlySearchedBloc.state)
          .thenReturn(const EmptyRecentlySearchedState());
      // Stub the behavior of the bloc to emit Genres Loading state
      when(() => genresBloc.state).thenReturn(const LoadingGenresBlocState());

      whenListen<RecentlySearchedState>(
        recentlySearchedBloc,
        Stream<RecentlySearchedState>.fromIterable([
          const EmptyRecentlySearchedState(),
        ]),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<RecentlySearchedBloc>(
                create: (context) => recentlySearchedBloc,
              ),
              BlocProvider<GenresBloc>(
                create: (context) => genresBloc,
              ),
            ],
            child: TestableWidget()
                .makeTestableWidget(child: const CreateBlocEmptyState()),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Empty + Genres Loading state is rendered
      expect(find.byType(CreateGenresSection), findsOneWidget);
      expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);
    });
    testWidgets('renders empty state with loaded GenresBlocState',
        (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Empty state
      when(() => recentlySearchedBloc.state)
          .thenReturn(const EmptyRecentlySearchedState());
      // Stub the behavior of the bloc to emit Loaded Genres state
      when(() => genresBloc.state)
          .thenReturn(LoadedGenresBlocState(data: _createGenresList(image)));

      whenListen<RecentlySearchedState>(
        recentlySearchedBloc,
        Stream<RecentlySearchedState>.fromIterable([
          const EmptyRecentlySearchedState(),
        ]),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<RecentlySearchedBloc>(
                create: (context) => recentlySearchedBloc,
              ),
              BlocProvider<GenresBloc>(
                create: (context) => genresBloc,
              ),
            ],
            child: TestableWidget()
                .makeTestableWidget(child: const CreateBlocEmptyState()),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the (Empty + Genres Loaded) state is rendered
      expect(find.byType(CreateGenresSection), findsOneWidget);
      expect(find.byType(GenresGridView), findsOneWidget);
    });
    testWidgets('renders Loaded state with loading GenresBlocState',
        (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loaded state
      when(() => recentlySearchedBloc.state)
          .thenReturn(LoadedRecentlySearchedState(data: _createList(image)));
      // Stub the behavior of the bloc to emit Genres Loading state
      when(() => genresBloc.state).thenReturn(const LoadingGenresBlocState());

      whenListen<RecentlySearchedState>(
        recentlySearchedBloc,
        Stream<RecentlySearchedState>.fromIterable([
          LoadedRecentlySearchedState(data: _createList(image)),
        ]),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<RecentlySearchedBloc>(
                create: (context) => recentlySearchedBloc,
              ),
              BlocProvider<GenresBloc>(
                create: (context) => genresBloc,
              ),
            ],
            child: MaterialApp(
              home: Scaffold(
                body: TestableWidget()
                    .makeTestableWidget(child: const CreateBlocEmptyState()),
              ),
            ),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the (Loaded + Genres Loading) state is rendered
      expect(find.byType(CreateGenresSection), findsOneWidget);
      expect(find.byType(CreateRecentlySearchedSection), findsOneWidget);
      expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);
    });
  });
}

List<SongModel> _createList(String image) {
  return [
    SongModel(
        id: "1",
        title: "title",
        artistNames: "name",
        image: image,
        type: 'track',
        preview: "preview",
        isFavourite: false),
  ];
}

List<MusicGenre> _createGenresList(String image) {
  return [MusicGenre(id: "1", name: "name", image: image)];
}

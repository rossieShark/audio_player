import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/ui/widgets/screens/index.dart';
import 'package:audio_player/ui/widgets/widgets/fading_indicator.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../home_screen/golden_image.dart';
import '../testable_widget_sample.dart';

class MockDetailMusicPageBloc extends MockBloc<SearchEvent, SearchState>
    implements SearchResultBloc {}

class MockMusicBloc extends MockBloc<MusicEvent, MusicState>
    implements MusicBloc {}

class MockRecentlySearchedBloc
    extends MockBloc<RecentlySearchedEvent, RecentlySearchedState>
    implements RecentlySearchedBloc {}

void main() {
  group('SearchPage Widget Tests', () {
    late MockDetailMusicPageBloc mockBloc;
    late MockRecentlySearchedBloc recentlySearchedBloc;
    late MockMusicBloc musicBloc;
    late String image;
    setUp(() {
      mockBloc = MockDetailMusicPageBloc();
      musicBloc = MockMusicBloc();
      recentlySearchedBloc = MockRecentlySearchedBloc();
      image = returnTestImage();
    });
    testWidgets('renders loading state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loading state
      when(() => mockBloc.state).thenReturn(const LoadingSearchState());

      whenListen<SearchState>(
        mockBloc,
        Stream<SearchState>.fromIterable([
          const LoadingSearchState(),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<SearchResultBloc>(
                create: (context) => mockBloc,
              ),
            ],
            child:
                TestableWidget().makeTestableWidget(child: const SearchPage()),
          ),
        ),
      );
      await tester.pump(Duration.zero);
      // Verify that the Loading state is rendered
      expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);
      expect(find.byType(SliverAppBar), findsOneWidget);
    });

    testWidgets('renders empty state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Empty state
      when(() => mockBloc.state).thenReturn(const EmptySearchState());
      // Stub the behavior of the bloc to emit Loaded RecentlySearched state
      when(() => recentlySearchedBloc.state)
          .thenReturn(LoadedRecentlySearchedState(data: createList(image)));

      whenListen<SearchState>(
        mockBloc,
        Stream<SearchState>.fromIterable([
          const EmptySearchState(),
        ]),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<SearchResultBloc>(
                create: (context) => mockBloc,
              ),
              BlocProvider<RecentlySearchedBloc>(
                create: (context) => recentlySearchedBloc,
              ),
            ],
            child:
                TestableWidget().makeTestableWidget(child: const SearchPage()),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the (Empty + Loaded RecentlySearched) state is rendered
      expect(find.byType(MobileRecentlySearchedSection), findsOneWidget);
    });

    testWidgets(
      'renders loaded state',
      (WidgetTester tester) async {
        // Stub the behavior of the SearchResultBloc to emit Loaded state
        when(() => mockBloc.state)
            .thenReturn(LoadedSearchState(data: _createSearchData(image)));

        // Stub the behavior of the MusicBloc to emit MusicState
        when(() => musicBloc.state).thenReturn(MusicState(
            playlist: [],
            currentSongIndex: 0,
            currentSongId: 0,
            isPlaying: false));

        // Stub the behavior of the RecentlySearchedBloc when AddToRecentlySearchedEvent is emitted
        when(() => recentlySearchedBloc
                .add(AddToRecentlySearchedEvent(createList(image).first)))
            .thenAnswer((_) {
          // Return the expected state here
          return recentlySearchedBloc
              .emit(RecentlySearchedState.loaded(data: createList(image)));
        });

        // Set up listeners for RecentlySearchedBloc and SearchResultBloc
        whenListen<RecentlySearchedState>(
          recentlySearchedBloc,
          Stream<RecentlySearchedState>.fromIterable([
            RecentlySearchedState.loaded(data: createList(image)),
          ]),
        );

        whenListen<SearchState>(
          mockBloc,
          Stream<SearchState>.fromIterable([
            LoadedSearchState(data: _createSearchData(image)),
          ]),
        );

        // Build our widget and trigger a frame.
        await tester.pumpWidget(MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<SearchResultBloc>(
                create: (context) => mockBloc,
              ),
              BlocProvider<MusicBloc>(
                create: (context) => musicBloc,
              ),
              BlocProvider<RecentlySearchedBloc>(
                create: (context) => recentlySearchedBloc,
              ),
            ],
            child: TestableWidget().makeTestableWidget(
              child: const SearchPage(),
            ),
          ),
        ));

        await tester.pump(Duration.zero);
        expect(find.byType(SearchListView), findsOneWidget);

        // Create a pointer gesture to simulate mouse interaction
        final gesture =
            await tester.createGesture(kind: PointerDeviceKind.mouse);
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);
        await tester.pump();

        // Move the mouse over the CreateSearchImageSection
        await gesture
            .moveTo(tester.getCenter(find.byType(CreateSearchImageSection)));
        await tester.pumpAndSettle();

        expect(find.byType(CreateSearchPlayButton), findsOneWidget);

        // Tap the CreateSearchPlayButton
        await tester.tap(find.byType(CreateSearchPlayButton));
        await tester.pump(Duration.zero);

        // Verify the state of RecentlySearchedBloc after the interaction
        expect(
          recentlySearchedBloc.state,
          isA<LoadedRecentlySearchedState>().having(
            (state) => state.data.length,
            'data count',
            1,
          ),
        );
      },
    );
  });
}

List<SongModel> createList(String image) {
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

List<SearchData> _createSearchData(String image) {
  return [
    SearchData(
      id: 1,
      title: "title",
      type: "track",
      preview: "preview",
      artist: SearchDataArtist(
        name: "name",
        image: image,
      ),
    )
  ];
}

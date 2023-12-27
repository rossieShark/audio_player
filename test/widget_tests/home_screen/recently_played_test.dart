import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/ui/widgets/screens/home_screen/home_screen_index.dart';
import 'package:audio_player/ui/widgets/widgets/responsive_widgets/platform_widget/extended_platform.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../testable_widget_sample.dart';
import 'golden_image.dart';

class MockRecentlyPlayedBloc
    extends MockBloc<RecentlyPlayedBlocEvent, RecentlyPlayedState>
    implements RecentlyPlayedBloc {}

class MockMusicBloc extends MockBloc<MusicEvent, MusicState>
    implements MusicBloc {}

void main() {
  group('FavoriteArtistList Widget Tests', () {
    late MockRecentlyPlayedBloc mockBloc;
    late MockMusicBloc musicBloc;
    late String image;

    setUp(() {
      mockBloc = MockRecentlyPlayedBloc();
      musicBloc = MockMusicBloc();
      image = returnTestImage();
    });
    testWidgets('renders loading state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loading state
      when(() => mockBloc.state).thenReturn(
          const LoadingRecentlyPlayedState()); // Stub state instead of initialState

      whenListen<RecentlyPlayedState>(
        mockBloc,
        Stream<RecentlyPlayedState>.fromIterable([
          const LoadingRecentlyPlayedState(),
        ]),
      );

      // Build widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<RecentlyPlayedBloc>(
            create: (context) => mockBloc,
            child: const RecentlyPlayedWidget(),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Loading state is rendered
      expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);
    });

    testWidgets('renders error state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Error state
      when(() => mockBloc.state).thenReturn(
          const ErrorRecentlyPlayedState()); // Stub state instead of initialState

      whenListen<RecentlyPlayedState>(
        mockBloc,
        Stream<RecentlyPlayedState>.fromIterable([
          const ErrorRecentlyPlayedState(),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<RecentlyPlayedBloc>(
            create: (context) => mockBloc,
            child: TestableWidget()
                .makeTestableWidget(child: const RecentlyPlayedWidget()),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Error state is rendered
      expect(find.byType(NoResultsWidget), findsOneWidget);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets(
      'renders loaded state for mobiles',
      (WidgetTester tester) async {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        // Stub the behavior of the bloc to emit Loaded state
        when(() => mockBloc.state).thenReturn(LoadedRecentlyPlayedState(
            data:
                _createTestList(image))); // Stub state instead of initialState
        when(() => musicBloc.state).thenReturn(MusicState(
            playlist: [],
            currentSongIndex: 0,
            currentSongId: 0,
            isPlaying: false));

        whenListen<RecentlyPlayedState>(
          mockBloc,
          Stream<RecentlyPlayedState>.fromIterable([
            LoadedRecentlyPlayedState(data: _createTestList(image)),
          ]),
        );

        // Build widget and trigger a frame.
        await tester.pumpWidget(
          MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider<RecentlyPlayedBloc>(
                  create: (context) => mockBloc,
                ),
                BlocProvider<MusicBloc>(
                  create: (context) => musicBloc,
                )
              ],
              child: TestableWidget()
                  .makeTestableWidget(child: const RecentlyPlayedWidget()),
            ),
          ),
        );

        await tester.pump(Duration.zero);

        expect(find.byType(ImageListView), findsOneWidget);
        expect(find.byType(ImageScroll), findsNothing);
        debugDefaultTargetPlatformOverride = null;
      },
    );
    testWidgets(
        'PlatformBuilder should render correct widget based on platform',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PlatformBuilder(
            iOS: const ImageScroll(chartItems: []),
            android: const ImageScroll(chartItems: []),
            other: const ImageListView(chartItems: []),
            builder: (context, child, widget) {
              return widget;
            },
          ),
        ),
      );

      // Verify that the correct widget is rendered based on the platform
      if (ExtendedPlatform.isIOS) {
        expect(find.byType(ImageScroll), findsOneWidget);
        expect(find.byType(ImageListView), findsNothing);
      } else if (ExtendedPlatform.isAndroid) {
        expect(find.byType(ImageScroll), findsOneWidget);
        expect(find.byType(ImageListView), findsNothing);
      } else {
        expect(find.byType(ImageScroll), findsNothing);
        expect(find.byType(ImageListView), findsOneWidget);
      }
    });

    testWidgets('renders loaded state for web', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loaded state
      when(() => mockBloc.state).thenReturn(LoadedRecentlyPlayedState(
          data: _createTestList(image))); // Stub state instead of initialState
      when(() => musicBloc.state).thenReturn(MusicState(
          playlist: [],
          currentSongIndex: 0,
          currentSongId: 0,
          isPlaying: false));
      whenListen<RecentlyPlayedState>(
        mockBloc,
        Stream<RecentlyPlayedState>.fromIterable([
          LoadedRecentlyPlayedState(data: _createTestList(image)),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<RecentlyPlayedBloc>(
                create: (context) => mockBloc,
              ),
              BlocProvider<MusicBloc>(
                create: (context) => musicBloc,
              )
            ],
            child: TestableWidget()
                .makeTestableWidget(child: const RecentlyPlayedWidget()),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      expect(find.byType(ImageListView), findsOneWidget);
      expect(find.byType(ImageScroll), findsNothing);
    });
  });
}

List<RecentlyPlayedSong> _createTestList(String image) {
  return [
    RecentlyPlayedSong(
      id: 1,
      headerImageUrl: image,
      artistNames: 'name',
      title: 'title',
      type: 'type',
      preview: 'preview',
    ),
    RecentlyPlayedSong(
      id: 2,
      headerImageUrl: image,
      artistNames: 'name',
      title: 'title',
      type: 'type',
      preview: 'preview',
    )
  ];
}

class MockGoRouter extends Mock implements GoRouter {}

class MockGoRouterProvider extends StatelessWidget {
  const MockGoRouterProvider({
    required this.goRouter,
    required this.child,
    Key? key,
  }) : super(key: key);

  final MockGoRouter goRouter;
  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: InheritedGoRouter(
          goRouter: goRouter,
          child: child,
        ),
      );
}

List<RecentlyPlayedSong> createTestItems(String image) {
  return [
    RecentlyPlayedSong(
      id: 1,
      headerImageUrl: image,
      artistNames: 'Artist ',
      title: 'Title ',
      preview: 'Preview',
      type: 'track',
    ),
    RecentlyPlayedSong(
      id: 1,
      headerImageUrl: image,
      artistNames: 'Artist ',
      title: 'Title ',
      preview: 'Preview',
      type: 'track',
    )
  ];
}

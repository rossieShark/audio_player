import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/ui/widgets/screens/album_detail_screen/content_widgets/no_data_widget.dart';
import 'package:audio_player/app/ui/widgets/screens/detail_music_screen/mobile/detail_music_screen.dart';
import 'package:audio_player/app/ui/widgets/screens/detail_music_screen/web/inactive_web_detail.dart';
import 'package:audio_player/app/ui/widgets/screens/detail_music_screen/web/web_detail.dart';
import 'package:audio_player/app/ui/widgets/widgets/fading_indicator.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import 'home_screen/golden_image.dart';
import 'testable_widget_sample.dart';

class MockDetailMusicPageBloc
    extends MockBloc<DetailMusicPageEvent, DetailMusicPageState>
    implements DetailMusicPageBloc {}

class MockAudioPlayer extends Mock implements AudioPlayer {}

class MockMusicBloc extends MockBloc<MusicEvent, MusicState>
    implements MusicBloc {}

class MockFavouriteAlbumBloc
    extends MockBloc<FavoriteAlbumEvent, FavoriteAlbumState>
    implements FavoriteAlbumBloc {}

class MockFavouriteSongBloc
    extends MockBloc<FavoriteSongEvent, FavouriteSongState>
    implements FavoriteSongBloc {}

void main() {
  group('MobileDetailMusicPage Widget Tests', () {
    late MockAudioPlayer mockAudioPlayer;
    late MockDetailMusicPageBloc mockBloc;
    late MockMusicBloc musicBloc;
    late MockFavouriteAlbumBloc favouriteBloc;
    late MockFavouriteSongBloc favouriteSongBloc;
    late String image;

    setUp(() {
      mockAudioPlayer = MockAudioPlayer();
      mockBloc = MockDetailMusicPageBloc();
      musicBloc = MockMusicBloc();
      favouriteBloc = MockFavouriteAlbumBloc();
      favouriteSongBloc = MockFavouriteSongBloc();
      image = returnTestImage();
    });

    testWidgets('renders loading state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loading state
      when(() => mockBloc.state).thenReturn(
          const LoadingDetailMusicPageState()); // Stub state instead of initialState

      whenListen<DetailMusicPageState>(
        mockBloc,
        Stream<DetailMusicPageState>.fromIterable([
          const LoadingDetailMusicPageState(),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DetailMusicPageBloc>(
            create: (context) => mockBloc,
            child: const MobileDetailMusicPage(
              param: '1',
              height: 200,
            ),
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
          const ErrorDetailMusicPageState()); // Stub state instead of initialState

      whenListen<DetailMusicPageState>(
        mockBloc,
        Stream<DetailMusicPageState>.fromIterable([
          const ErrorDetailMusicPageState(),
        ]),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DetailMusicPageBloc>(
            create: (context) => mockBloc,
            child: TestableWidget().makeTestableWidget(
              child: const MobileDetailMusicPage(
                param: '1',
                height: 200,
              ),
            ),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Error state is rendered
      expect(find.byType(NoDataWidget), findsOneWidget);
    });

    testWidgets(
      'renders loaded state',
      (WidgetTester tester) async {
        // Stub the behavior of the bloc to emit Loaded state
        when(() => mockBloc.state).thenReturn(LoadedDetailMusicPageState(
            songDetail: _createTestList(
                image: image))); // Stub state instead of initialState
        when(() => musicBloc.state).thenReturn(MusicState(
            playlist: [],
            currentSongIndex: 0,
            currentSongId: 0,
            isPlaying: false));
        when(() => favouriteBloc.state)
            .thenReturn(const FavoriteAlbumState.loaded(
          data: [],
        ));

        when(() => favouriteSongBloc.state)
            .thenReturn(const FavouriteSongState.loaded(
          data: [],
        ));
        when(() => musicBloc.audioPlayer).thenReturn(mockAudioPlayer);
        when(() => mockAudioPlayer.onPositionChanged).thenAnswer((_) {
          return Stream<Duration>.value(const Duration(
              seconds: 30)); // Replace with your desired behavior
        });
        when(() => mockAudioPlayer.onDurationChanged).thenAnswer((_) {
          return Stream<Duration>.value(const Duration(
              seconds: 30)); // Replace with your desired behavior
        });
        whenListen<DetailMusicPageState>(
          mockBloc,
          Stream<DetailMusicPageState>.fromIterable([
            LoadedDetailMusicPageState(
                songDetail: _createTestList(image: image)),
          ]),
        );

        // Build our widget and trigger a frame.
        await tester.pumpWidget(MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<DetailMusicPageBloc>(
                create: (context) => mockBloc,
              ),
              BlocProvider<MusicBloc>(
                create: (context) => musicBloc,
              ),
              BlocProvider<FavoriteAlbumBloc>(
                create: (context) => favouriteBloc,
              ),
              BlocProvider<FavoriteSongBloc>(
                create: (context) => favouriteSongBloc,
              )
            ],
            child: TestableWidget().makeTestableWidget(
              child: const MobileDetailMusicPage(
                param: '1',
                height: 200,
              ),
            ),
          ),
        ));

        await tester.pump(Duration.zero);

        expect(find.byType(MobileDetailMusicPage), findsOneWidget);
        expect(find.byType(NoDataWidget), findsNothing);
      },
    );
  });
  group('WebDetailMusicPage Widget Tests', () {
    late MockDetailMusicPageBloc mockBloc;
    late MockMusicBloc musicBloc;

    setUp(() {
      mockBloc = MockDetailMusicPageBloc();
      musicBloc = MockMusicBloc();
    });

    testWidgets('WebDetailMusicPage renders incorrectly',
        (WidgetTester tester) async {
      // Stub the behavior of the MusicBloc to emit a MusicState
      when(() => musicBloc.state).thenReturn(MusicState(
          currentSongId: -1,
          playlist: [],
          isPlaying: false,
          currentSongIndex: 0));

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<MusicBloc>(
            create: (context) => musicBloc,
            child: const WebDetailMusicPage(),
          ),
        ),
      );

      // Verify that the WebDetailMusicPageContent is not rendered when there is no current song ID
      expect(find.byType(WebDetailMusicPageContent), findsNothing);
      expect(find.byType(InactiveWebDetailPage), findsOneWidget);
    });

    testWidgets('WebDetailMusicPage renders correctly',
        (WidgetTester tester) async {
      // Stub the behavior of the MusicBloc to emit a MusicState with a non-null currentSongId
      when(() => musicBloc.state).thenReturn(MusicState(
          currentSongId: 1,
          playlist: [],
          currentSongIndex: 0,
          isPlaying: false));
      when(() => mockBloc.state)
          .thenReturn(const LoadingDetailMusicPageState());

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<DetailMusicPageBloc>(
                create: (context) => mockBloc,
              ),
              BlocProvider<MusicBloc>(
                create: (context) => musicBloc,
              ),
            ],
            child: const WebDetailMusicPage(),
          ),
        ),
      );

      // Verify that the InactiveWebDetailPage is not rendered when currentSongId is non-null
      expect(find.byType(InactiveWebDetailPage), findsNothing);
      expect(find.byType(WebDetailMusicPageContent), findsOneWidget);
    });
  });
  group('WebDetailMusicPageContent Widget Tests', () {
    late MockAudioPlayer mockAudioPlayer;
    late MockDetailMusicPageBloc mockBloc;
    late MockMusicBloc musicBloc;
    late MockFavouriteAlbumBloc favouriteBloc;
    late MockFavouriteSongBloc favouriteSongBloc;
    late String image;
    setUp(() {
      mockAudioPlayer = MockAudioPlayer();
      mockBloc = MockDetailMusicPageBloc();
      musicBloc = MockMusicBloc();
      favouriteBloc = MockFavouriteAlbumBloc();
      favouriteSongBloc = MockFavouriteSongBloc();
      image = returnTestImage();
    });
    testWidgets('renders loading state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loading state
      when(() => mockBloc.state).thenReturn(
          const LoadingDetailMusicPageState()); // Stub state instead of initialState

      whenListen<DetailMusicPageState>(
        mockBloc,
        Stream<DetailMusicPageState>.fromIterable([
          const LoadingDetailMusicPageState(),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DetailMusicPageBloc>(
            create: (context) => mockBloc,
            child: const WebDetailMusicPageContent(
              id: '1',
            ),
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
          const ErrorDetailMusicPageState()); // Stub state instead of initialState

      whenListen<DetailMusicPageState>(
        mockBloc,
        Stream<DetailMusicPageState>.fromIterable([
          const ErrorDetailMusicPageState(),
        ]),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DetailMusicPageBloc>(
            create: (context) => mockBloc,
            child: TestableWidget().makeTestableWidget(
              child: const WebDetailMusicPageContent(
                id: '1',
              ),
            ),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Error state is rendered
      expect(find.byType(NoDataWidget), findsOneWidget);
    });

    group('WebDetailMusicPageContent Widget Tests', () {
      late MockAudioPlayer mockAudioPlayer;
      late MockDetailMusicPageBloc mockBloc;
      late MockMusicBloc musicBloc;
      late MockFavouriteAlbumBloc favouriteBloc;
      late MockFavouriteSongBloc favouriteSongBloc;
      late String image;

      setUp(() {
        mockAudioPlayer = MockAudioPlayer();
        mockBloc = MockDetailMusicPageBloc();
        musicBloc = MockMusicBloc();
        favouriteBloc = MockFavouriteAlbumBloc();
        favouriteSongBloc = MockFavouriteSongBloc();
        image = returnTestImage();
      });

      testWidgets('renders loading state', (WidgetTester tester) async {
        // Stub the behavior of the bloc to emit Loading state
        when(() => mockBloc.state)
            .thenReturn(const LoadingDetailMusicPageState());

        whenListen<DetailMusicPageState>(
          mockBloc,
          Stream<DetailMusicPageState>.fromIterable([
            const LoadingDetailMusicPageState(),
          ]),
        );

        // Build our widget and trigger a frame.
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<DetailMusicPageBloc>(
              create: (context) => mockBloc,
              child: const WebDetailMusicPageContent(
                id: '1',
              ),
            ),
          ),
        );
        await tester.pump(Duration.zero);

        // Verify that the Loading state is rendered
        expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);
      });

      testWidgets('renders error state', (WidgetTester tester) async {
        // Stub the behavior of the bloc to emit Error state
        when(() => mockBloc.state)
            .thenReturn(const ErrorDetailMusicPageState());

        whenListen<DetailMusicPageState>(
          mockBloc,
          Stream<DetailMusicPageState>.fromIterable([
            const ErrorDetailMusicPageState(),
          ]),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<DetailMusicPageBloc>(
              create: (context) => mockBloc,
              child: TestableWidget().makeTestableWidget(
                child: const WebDetailMusicPageContent(
                  id: '1',
                ),
              ),
            ),
          ),
        );
        await tester.pump(Duration.zero);

        // Verify that the Error state is rendered
        expect(find.byType(NoDataWidget), findsOneWidget);
      });

      testWidgets(
        'renders loaded state wider screen',
        (WidgetTester tester) async {
          // Stub the behavior of the bloc to emit Loaded state
          when(() => mockBloc.state).thenReturn(
            LoadedDetailMusicPageState(
              songDetail: _createTestList(image: image),
            ),
          );

          when(() => musicBloc.state).thenReturn(MusicState(
            playlist: [],
            currentSongIndex: 0,
            currentSongId: 0,
            isPlaying: false,
          ));

          when(() => favouriteBloc.state).thenReturn(
            const FavoriteAlbumState.loaded(data: []),
          );

          when(() => favouriteSongBloc.state).thenReturn(
            const FavouriteSongState.loaded(data: []),
          );

          when(() => musicBloc.audioPlayer).thenReturn(mockAudioPlayer);
          when(() => mockAudioPlayer.onPositionChanged).thenAnswer((_) {
            return Stream<Duration>.value(
              const Duration(seconds: 30),
            );
          });
          when(() => mockAudioPlayer.onDurationChanged).thenAnswer((_) {
            return Stream<Duration>.value(
              const Duration(seconds: 30),
            );
          });

          whenListen<DetailMusicPageState>(
            mockBloc,
            Stream<DetailMusicPageState>.fromIterable([
              LoadedDetailMusicPageState(
                  songDetail: _createTestList(image: image)),
            ]),
          );

          // Build our widget and trigger a frame.
          await tester.pumpWidget(MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider<DetailMusicPageBloc>(
                  create: (context) => mockBloc,
                ),
                BlocProvider<MusicBloc>(
                  create: (context) => musicBloc,
                ),
                BlocProvider<FavoriteAlbumBloc>(
                  create: (context) => favouriteBloc,
                ),
                BlocProvider<FavoriteSongBloc>(
                  create: (context) => favouriteSongBloc,
                ),
              ],
              child: TestableWidget().makeTestableWidget(
                child: const WebDetailMusicPageContent(
                  id: '1',
                ),
              ),
            ),
          ));

          await tester.pump(Duration.zero);

          expect(find.byType(CreateMainWebContent), findsOneWidget);
          expect(find.byType(NoDataWidget), findsNothing);
          expect(find.byType(CustomFadingCircleIndicator), findsNothing);

          if (tester.view.physicalSize.width <= 600) {
            expect(find.byType(CreateNarrowContent), findsOneWidget);
            expect(find.byType(CreateMediumContent), findsNothing);
            expect(find.byType(CreateMediumExtraContent), findsNothing);
            expect(find.byType(CreateLargeContent), findsNothing);
          } else if (tester.view.physicalSize.width <= 900) {
            expect(find.byType(CreateNarrowContent), findsNothing);
            expect(find.byType(CreateMediumContent), findsOneWidget);
            expect(find.byType(CreateMediumExtraContent), findsNothing);
            expect(find.byType(CreateLargeContent), findsNothing);
          } else if (tester.view.physicalSize.width <= 1280) {
            expect(find.byType(CreateNarrowContent), findsNothing);
            expect(find.byType(CreateMediumContent), findsNothing);
            expect(find.byType(CreateMediumExtraContent), findsOneWidget);
            expect(find.byType(CreateLargeContent), findsNothing);
          }
        },
      );
    });

    testWidgets(
      'renders loaded state narrow screen',
      (WidgetTester tester) async {
        // Stub the behavior of the bloc to emit Loaded state
        when(() => mockBloc.state).thenReturn(
          LoadedDetailMusicPageState(songDetail: _createTestList(image: image)),
        );

        when(() => musicBloc.state).thenReturn(
          MusicState(
            playlist: [],
            currentSongIndex: 0,
            currentSongId: 0,
            isPlaying: false,
          ),
        );

        when(() => favouriteBloc.state).thenReturn(
          const FavoriteAlbumState.loaded(data: []),
        );

        when(() => favouriteSongBloc.state).thenReturn(
          const FavouriteSongState.loaded(data: []),
        );

        when(() => musicBloc.audioPlayer).thenReturn(mockAudioPlayer);

        when(() => mockAudioPlayer.onPositionChanged).thenAnswer((_) {
          return Stream<Duration>.value(
            const Duration(seconds: 30),
          );
        });

        when(() => mockAudioPlayer.onDurationChanged).thenAnswer((_) {
          return Stream<Duration>.value(
            const Duration(seconds: 30),
          );
        });

        whenListen<DetailMusicPageState>(
          mockBloc,
          Stream<DetailMusicPageState>.fromIterable([
            LoadedDetailMusicPageState(
                songDetail: _createTestList(image: image)),
          ]),
        );

        tester.view.physicalSize = const Size(460, 400);
        tester.view.devicePixelRatio = 1.0;

        // Build our widget and trigger a frame.
        await tester.pumpWidget(
          MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider<DetailMusicPageBloc>(
                  create: (context) => mockBloc,
                ),
                BlocProvider<MusicBloc>(
                  create: (context) => musicBloc,
                ),
                BlocProvider<FavoriteAlbumBloc>(
                  create: (context) => favouriteBloc,
                ),
                BlocProvider<FavoriteSongBloc>(
                  create: (context) => favouriteSongBloc,
                ),
              ],
              child: TestableWidget().makeTestableWidget(
                child: const WebDetailMusicPageContent(
                  id: '1',
                ),
              ),
            ),
          ),
        );

        await tester.pump(Duration.zero);

        // Verify expectations for rendering on a narrow screen
        expect(find.byType(CreateMainWebContent), findsOneWidget);
        expect(find.byType(NoDataWidget), findsNothing);
        expect(find.byType(CreateNarrowContent), findsOneWidget);
        expect(find.byType(CustomFadingCircleIndicator), findsNothing);
      },
    );

    testWidgets(
      'renders loaded state mediumExtra screen',
      (WidgetTester tester) async {
        // Stub the behavior of the bloc to emit Loaded state
        when(() => mockBloc.state).thenReturn(
          LoadedDetailMusicPageState(songDetail: _createTestList(image: image)),
        );

        when(() => musicBloc.state).thenReturn(
          MusicState(
            playlist: [],
            currentSongIndex: 0,
            currentSongId: 0,
            isPlaying: false,
          ),
        );

        when(() => favouriteBloc.state).thenReturn(
          const FavoriteAlbumState.loaded(data: []),
        );

        when(() => favouriteSongBloc.state).thenReturn(
          const FavouriteSongState.loaded(data: []),
        );

        when(() => musicBloc.audioPlayer).thenReturn(mockAudioPlayer);

        when(() => mockAudioPlayer.onPositionChanged).thenAnswer((_) {
          return Stream<Duration>.value(
            const Duration(seconds: 30),
          );
        });

        when(() => mockAudioPlayer.onDurationChanged).thenAnswer((_) {
          return Stream<Duration>.value(
            const Duration(seconds: 30),
          );
        });

        whenListen<DetailMusicPageState>(
          mockBloc,
          Stream<DetailMusicPageState>.fromIterable([
            LoadedDetailMusicPageState(
                songDetail: _createTestList(image: image)),
          ]),
        );

        tester.view.physicalSize = const Size(1000, 400);
        tester.view.devicePixelRatio = 1.0;

        // Build our widget and trigger a frame.
        await tester.pumpWidget(
          MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider<DetailMusicPageBloc>(
                  create: (context) => mockBloc,
                ),
                BlocProvider<MusicBloc>(
                  create: (context) => musicBloc,
                ),
                BlocProvider<FavoriteAlbumBloc>(
                  create: (context) => favouriteBloc,
                ),
                BlocProvider<FavoriteSongBloc>(
                  create: (context) => favouriteSongBloc,
                ),
              ],
              child: TestableWidget().makeTestableWidget(
                child: const WebDetailMusicPageContent(
                  id: '1',
                ),
              ),
            ),
          ),
        );

        await tester.pump(Duration.zero);

        // Verify expectations for rendering on a mediumExtra screen
        expect(find.byType(CreateMainWebContent), findsOneWidget);
        expect(find.byType(NoDataWidget), findsNothing);
        expect(find.byType(CreateMediumExtraContent), findsOneWidget);
        expect(find.byType(CustomFadingCircleIndicator), findsNothing);
      },
    );

    testWidgets(
      'renders loaded state large screen',
      (WidgetTester tester) async {
        // Stub the behavior of the bloc to emit Loaded state
        when(() => mockBloc.state).thenReturn(
          LoadedDetailMusicPageState(songDetail: _createTestList(image: image)),
        );

        when(() => musicBloc.state).thenReturn(
          MusicState(
            playlist: [],
            currentSongIndex: 0,
            currentSongId: 0,
            isPlaying: false,
          ),
        );

        when(() => favouriteBloc.state).thenReturn(
          const FavoriteAlbumState.loaded(data: []),
        );

        when(() => favouriteSongBloc.state).thenReturn(
          const FavouriteSongState.loaded(data: []),
        );

        when(() => musicBloc.audioPlayer).thenReturn(mockAudioPlayer);

        when(() => mockAudioPlayer.onPositionChanged).thenAnswer((_) {
          return Stream<Duration>.value(
            const Duration(seconds: 30),
          );
        });

        when(() => mockAudioPlayer.onDurationChanged).thenAnswer((_) {
          return Stream<Duration>.value(
            const Duration(seconds: 30),
          );
        });

        whenListen<DetailMusicPageState>(
          mockBloc,
          Stream<DetailMusicPageState>.fromIterable([
            LoadedDetailMusicPageState(
                songDetail: _createTestList(image: image)),
          ]),
        );

        tester.view.physicalSize = const Size(1400, 400);
        tester.view.devicePixelRatio = 1.0;

        // Build our widget and trigger a frame.
        await tester.pumpWidget(
          MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider<DetailMusicPageBloc>(
                  create: (context) => mockBloc,
                ),
                BlocProvider<MusicBloc>(
                  create: (context) => musicBloc,
                ),
                BlocProvider<FavoriteAlbumBloc>(
                  create: (context) => favouriteBloc,
                ),
                BlocProvider<FavoriteSongBloc>(
                  create: (context) => favouriteSongBloc,
                ),
              ],
              child: TestableWidget().makeTestableWidget(
                child: const WebDetailMusicPageContent(
                  id: '1',
                ),
              ),
            ),
          ),
        );

        await tester.pump(Duration.zero);

        // Verify expectations for rendering on a large screen
        expect(find.byType(CreateMainWebContent), findsOneWidget);
        expect(find.byType(NoDataWidget), findsNothing);
        expect(find.byType(CreateLargeContent), findsOneWidget);
        expect(find.byType(CustomFadingCircleIndicator), findsNothing);
      },
    );
  });
}

DetailInfoSong? _createTestList({required String image}) {
  return DetailInfoSong(
    id: 1,
    imageUrl: image,
    artistNames: 'name',
    title: 'title',
    type: 'type',
    preview: 'preview',
  );
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

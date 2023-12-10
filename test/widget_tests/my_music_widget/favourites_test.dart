import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_folders/my_favorite_album.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_folders/my_favorite_songs.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_folders/widgets/common_favourite_list_biew_body.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_folders/widgets/favorite_list_content.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_folders/widgets/screen_main_structure.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../firebase.dart';
import '../home_screen/golden_image.dart';
import '../testable_widget_sample.dart';

class MockMusicBloc extends MockBloc<MusicEvent, MusicState>
    implements MusicBloc {}

class MockFavouriteAlbumBloc
    extends MockBloc<FavoriteAlbumEvent, FavoriteAlbumState>
    implements FavoriteAlbumBloc {}

class MockFavouriteSongBloc
    extends MockBloc<FavoriteSongEvent, FavouriteSongState>
    implements FavoriteSongBloc {}

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('MyMusicPage Widget Tests', () {
    late MockFavouriteAlbumBloc favouriteBloc;
    late String image;
    late MockGoRouter mockGoRouter;

    setUp(() {
      favouriteBloc = MockFavouriteAlbumBloc();
      image = returnTestImage();
      mockGoRouter = MockGoRouter();
    });

    testWidgets('MyFavoriteAlbum loading state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loading state
      when(() => favouriteBloc.state)
          .thenReturn(const LoadingFavoriteAlbumState());

      // Stub the behavior of goRouter
      when(() => mockGoRouter.pop()).thenAnswer((_) => Future<void>.value());

      whenListen<FavoriteAlbumState>(
        favouriteBloc,
        Stream<FavoriteAlbumState>.fromIterable([
          const LoadingFavoriteAlbumState(),
        ]),
      );

      // Build widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<FavoriteAlbumBloc>(
            create: (context) => favouriteBloc,
            child: MockGoRouterProvider(
              goRouter: mockGoRouter,
              child: const FavoritePageStructure(
                child: MyFavoriteAlbum(),
              ),
            ),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Loading state is rendered
      expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);

      // Test IconButtonBehavior
      await tester.tap(find.byIcon(Icons.arrow_back).first);
      await tester.pump(Duration.zero);
      verify(() => mockGoRouter.pop()).called(1);

      await tester.tap(find.byIcon(Icons.arrow_back).last);
      await tester.pump(Duration.zero);
      verify(() => mockGoRouter.pop()).called(1);
    });

    testWidgets('MyFavoriteAlbum noResults state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit NoResults state
      when(() => favouriteBloc.state)
          .thenReturn(const NoResultsFavoriteAlbumState());

      whenListen<FavoriteAlbumState>(
        favouriteBloc,
        Stream<FavoriteAlbumState>.fromIterable([
          const NoResultsFavoriteAlbumState(),
        ]),
      );

      // Build  widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<FavoriteAlbumBloc>(
            create: (context) => favouriteBloc,
            child: TestableWidget().makeTestableWidget(
              child: const MyFavoriteAlbum(),
            ),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the NoResults state is rendered
      expect(find.byType(NoFavouritesTextWidget), findsOneWidget);
    });

    testWidgets('MyFavoriteAlbum Loaded state', (WidgetTester tester) async {
      final goRouterUrl = Uri(
        path: '/${Routes().albumDetail}1',
        queryParameters: {
          'image': image,
        },
      ).toString();

      // Stub the behavior of the bloc to emit Loaded state
      when(() => favouriteBloc.state).thenReturn(LoadedFavoriteAlbumState(
          data: _createFavouritesList(image, 'album')));

      // Stub the behavior of goRouter to emit Loaded state
      when(() => mockGoRouter.push(goRouterUrl))
          .thenAnswer((_) => Future<void>.value());

      whenListen<FavoriteAlbumState>(
        favouriteBloc,
        Stream<FavoriteAlbumState>.fromIterable([
          LoadedFavoriteAlbumState(data: _createFavouritesList(image, 'album'))
        ]),
      );

      // Build  widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<FavoriteAlbumBloc>(
            create: (context) => favouriteBloc,
            child: MockGoRouterProvider(
                goRouter: mockGoRouter,
                child: const FavoritePageStructure(child: MyFavoriteAlbum())),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify that the Loaded state is rendered
      expect(find.byType(CreateFavouriteAlbumListView), findsOneWidget);
      expect(find.byType(NoFavouritesTextWidget), findsNothing);
      expect(find.byType(ListView), findsOneWidget);

      // Tap on CommonFavouriteListViewBody and verify if push is called
      await tester.tap(find.byType(CommonFavouriteListViewBody));
      await tester.pump(Duration.zero);
      verify(() => mockGoRouter.push(goRouterUrl)).called(1);
    });
  });
  group('MyFavoriteSongs Widget Tests', () {
    late MockFavouriteSongBloc favouriteSongBloc;
    late String image;
    late MockMusicBloc musicBloc;

    setUp(() {
      favouriteSongBloc = MockFavouriteSongBloc();
      image = returnTestImage();
      musicBloc = MockMusicBloc();
    });

    testWidgets('MyFavoriteSongs loading state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loading state
      when(() => favouriteSongBloc.state)
          .thenReturn(const LoadingFavouriteSongState());

      whenListen<FavouriteSongState>(
        favouriteSongBloc,
        Stream<FavouriteSongState>.fromIterable([
          const LoadingFavouriteSongState(),
        ]),
      );

      // Build widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<FavoriteSongBloc>(
            create: (context) => favouriteSongBloc,
            child: const FavoritePageStructure(
              child: MyFavoriteSongs(),
            ),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Loading state is rendered
      expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);

      // Test IconButton behavior
      await tester.tap(find.byIcon(Icons.filter_list_alt).first);
      await tester.pump(Duration.zero);

      verify(() => favouriteSongBloc.add(const SortSongsEvent())).called(1);
    });

    testWidgets('MyFavoriteSongs noResults state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loading state
      when(() => favouriteSongBloc.state)
          .thenReturn(const NoResultsFavouriteSongState());

      whenListen<FavouriteSongState>(
        favouriteSongBloc,
        Stream<FavouriteSongState>.fromIterable([
          const NoResultsFavouriteSongState(),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<FavoriteSongBloc>(
            create: (context) => favouriteSongBloc,
            child: TestableWidget().makeTestableWidget(
              child: const FavoritePageStructure(child: MyFavoriteSongs()),
            ),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the NoResults state is rendered
      expect(find.byType(NoFavouritesTextWidget), findsOneWidget);
    });

    testWidgets('MyFavoriteSongs Loaded state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loading state
      final mockGoRouter = MockGoRouter();
      final goRouterUrl = Uri(path: '/${Routes().detailTrack}1').toString();

      when(() => favouriteSongBloc.state).thenReturn(LoadedFavouriteSongState(
          data: _createFavouritesList(
              image, 'track'))); // Stub state instead of initialState
      when(() => mockGoRouter.push(goRouterUrl))
          .thenAnswer((_) => Future<void>.value());
      whenListen<FavouriteSongState>(
        favouriteSongBloc,
        Stream<FavouriteSongState>.fromIterable([
          LoadedFavouriteSongState(data: _createFavouritesList(image, 'track'))
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<FavoriteSongBloc>(
            create: (context) => favouriteSongBloc,
            child: TestableWidget().makeTestableWidget(
                child: MockGoRouterProvider(
                    goRouter: mockGoRouter,
                    child:
                        const FavoritePageStructure(child: MyFavoriteSongs()))),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify that the Loading state is rendered
      expect(find.byType(CreateFavouritesSongListView), findsOneWidget);
      expect(find.byType(NoFavouritesTextWidget), findsNothing);
      expect(find.byType(ListView), findsOneWidget);

      // Tap on CommonFavouriteListViewBody and verify if push is called
      await tester.tap(find.byType(CommonFavouriteListViewBody));
      await tester.pump(Duration.zero);
      verify(() => mockGoRouter.push(goRouterUrl)).called(1);
    });

    testWidgets('FavouriteListContent  test', (WidgetTester tester) async {
      // Stub the behavior of the musicbloc
      when(() => musicBloc.state).thenReturn(MusicState(
          playlist: [],
          currentSongIndex: 0,
          currentSongId: 0,
          isPlaying: false));
      when(() => musicBloc.add(PlayPause(song: _createPlayedSong())))
          .thenAnswer((invocation) {
        MusicState(
            playlist: [_createPlayedSong()],
            currentSongIndex: 1,
            currentSongId: 1,
            isPlaying: true);
      });

      whenListen<MusicState>(
        musicBloc,
        Stream<MusicState>.fromIterable([
          MusicState(
              playlist: [_createPlayedSong()],
              currentSongIndex: 1,
              currentSongId: 1,
              isPlaying: true)
        ]),
      );
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
              providers: [
                BlocProvider<FavoriteSongBloc>(
                  create: (context) => favouriteSongBloc,
                ),
                BlocProvider<MusicBloc>(
                  create: (context) => musicBloc,
                ),
              ],
              child: Scaffold(
                body: TestableWidget().makeTestableWidget(
                    child: FavouriteListContent(
                        song: _createFavouritesList(image, 'track').first)),
              )),
        ),
      );
      await tester.pumpAndSettle();

      // Verify that the Loading state is rendered
      expect(find.byType(CreateImageSection), findsOneWidget);
      expect(find.byType(CreateSongTitle), findsOneWidget);
      expect(find.byType(IconButtonWidget), findsOneWidget);

      // Tap on CommonFavouriteListViewBody and verify if push is called
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await tester.pump();

      // Move the mouse over the CreateSearchImageSection
      await gesture.moveTo(tester.getCenter(find.byType(CreateImageSection)));
      await tester.pumpAndSettle();
      expect(find.byType(CreatePlayMusicFavButton), findsOneWidget);

      await tester.tap(find.byType(CreatePlayButton));
      await tester.pump(Duration.zero);
      expect(
        musicBloc.state,
        isA<MusicState>().having(
          (state) => state.playlist.length,
          'data count',
          1,
        ),
      );
    });
    testWidgets('FavouriteListContent  test while song isPlaying',
        (WidgetTester tester) async {
      // Stub the behavior of the musicbloc
      when(() => musicBloc.state).thenReturn(MusicState(
          playlist: [_createPlayedSong()],
          currentSongIndex: 1,
          currentSongId: 1,
          isPlaying: true));

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
              providers: [
                BlocProvider<FavoriteSongBloc>(
                  create: (context) => favouriteSongBloc,
                ),
                BlocProvider<MusicBloc>(
                  create: (context) => musicBloc,
                ),
              ],
              child: Scaffold(
                body: TestableWidget().makeTestableWidget(
                    child: FavouriteListContent(
                        song: _createFavouritesList(image, 'track').first)),
              )),
        ),
      );
      await tester.pumpAndSettle();

      // Verify that the Loading state is rendered
      expect(find.byType(CreateImageSection), findsOneWidget);
      expect(find.byType(CreateSongTitle), findsOneWidget);
      expect(find.byType(IconButtonWidget), findsOneWidget);

      // Tap on CommonFavouriteListViewBody and verify if push is called
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await tester.pump();

      // Move the mouse over the CreateSearchImageSection
      await gesture.moveTo(tester.getCenter(find.byType(CreateImageSection)));
      await tester.pumpAndSettle();
      expect(find.byType(CreatePlayMusicFavButton), findsOneWidget);
      expect(find.byIcon(Icons.pause), findsOneWidget);
    });
  });
}

List<SongModel> _createFavouritesList(String image, String type) {
  return [
    SongModel(
      id: "1",
      title: "title",
      artistNames: "artistNames",
      image: image,
      type: type,
      preview: "preview",
      isFavourite: false,
    )
  ];
}

PlayedSong _createPlayedSong() {
  return PlayedSong(id: 1, preview: "preview");
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
  Widget build(BuildContext context) {
    return InheritedGoRouter(
      goRouter: goRouter,
      child: MaterialApp(
        home: child,
      ),
    );
  }
}

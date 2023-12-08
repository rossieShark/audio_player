import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/ui/widgets/screens/album_detail_screen/detail_album_index.dart';
import 'package:audio_player/ui/widgets/widgets/fading_indicator.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'home_screen/golden_image.dart';
import 'testable_widget_sample.dart';

class MockAlbumDetailBloc
    extends MockBloc<AlbumDetailBlocEvent, AlbumDetailBlocState>
    implements AlbumDetailBloc {}

class MockMusicBloc extends MockBloc<MusicEvent, MusicState>
    implements MusicBloc {}

class MockFavouriteAlbumBloc
    extends MockBloc<FavoriteAlbumEvent, FavoriteAlbumState>
    implements FavoriteAlbumBloc {}

class MockFavouriteSongBloc
    extends MockBloc<FavoriteSongEvent, FavouriteSongState>
    implements FavoriteSongBloc {}

void main() {
  group('FavoriteArtistList Widget Tests', () {
    late MockAlbumDetailBloc mockBloc;
    late String image;
    late MockMusicBloc musicBloc;
    late MockFavouriteAlbumBloc favouriteBloc;
    late MockFavouriteSongBloc favouriteSongBloc;

    setUp(() {
      mockBloc = MockAlbumDetailBloc();
      image = returnTestImage();
      musicBloc = MockMusicBloc();
      favouriteBloc = MockFavouriteAlbumBloc();
      favouriteSongBloc = MockFavouriteSongBloc();
    });

    testWidgets('renders loading state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loading state
      when(() => mockBloc.state).thenReturn(
          const LoadingAlbumDetailBlocState()); // Stub state instead of initialState

      whenListen<AlbumDetailBlocState>(
        mockBloc,
        Stream<AlbumDetailBlocState>.fromIterable([
          const LoadingAlbumDetailBlocState(),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AlbumDetailBloc>(
            create: (context) => mockBloc,
            child: AlbumDetailWidget(
              param: '1',
              image: image,
              title: 'title',
              artist: 'artist',
            ),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Loading state is rendered
      expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);
    });

    testWidgets('renders empty state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Empty state
      when(() => mockBloc.state).thenReturn(
          const EmptyAlbumDetailBlocState()); // Stub state instead of initialState

      whenListen<AlbumDetailBlocState>(
        mockBloc,
        Stream<AlbumDetailBlocState>.fromIterable([
          const EmptyAlbumDetailBlocState(),
        ]),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AlbumDetailBloc>(
            create: (context) => mockBloc,
            child: TestableWidget().makeTestableWidget(
              child: AlbumDetailWidget(
                param: '1',
                image: image,
                title: 'title',
                artist: 'artist',
              ),
            ),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Empty state is rendered
      expect(find.byType(NoDataWidget), findsOneWidget);
    });

    testWidgets('renders error state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Error state
      when(() => mockBloc.state).thenReturn(
          const ErrorAlbumDetailBlocState()); // Stub state instead of initialState

      whenListen<AlbumDetailBlocState>(
        mockBloc,
        Stream<AlbumDetailBlocState>.fromIterable([
          const ErrorAlbumDetailBlocState(),
        ]),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AlbumDetailBloc>(
            create: (context) => mockBloc,
            child: TestableWidget().makeTestableWidget(
              child: AlbumDetailWidget(
                param: '1',
                image: image,
                title: 'title',
                artist: 'artist',
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
      'renders loaded state for mobiles',
      (WidgetTester tester) async {
        // Stub the behavior of the bloc to emit Loaded state
        when(() => mockBloc.state).thenReturn(LoadedAlbumDetailBlocState(
            albumDetailList:
                _createTestList())); // Stub state instead of initialState
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
        whenListen<AlbumDetailBlocState>(
          mockBloc,
          Stream<AlbumDetailBlocState>.fromIterable([
            LoadedAlbumDetailBlocState(albumDetailList: _createTestList()),
          ]),
        );

        // Build our widget and trigger a frame.
        await tester.pumpWidget(MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<AlbumDetailBloc>(
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
              child: AlbumDetailWidget(
                param: '1',
                image: image,
                title: 'title',
                artist: 'artist',
              ),
            ),
          ),
        ));

        await tester.pump(Duration.zero);

        expect(find.byType(AlbumDetailScreenBody), findsOneWidget);
        expect(find.byType(NoDataWidget), findsNothing);
      },
    );
  });
}

List<DetailAlbum> _createTestList() {
  return [
    const DetailAlbum(
      id: 1,
      albumid: 1,
      artistNames: 'name',
      title: 'title',
      type: 'type',
      preview: 'preview',
    ),
    const DetailAlbum(
      id: 2,
      albumid: 2,
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

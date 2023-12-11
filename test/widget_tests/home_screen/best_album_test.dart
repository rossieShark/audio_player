import 'dart:async';
import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/screens/home_screen/home_screen_index.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import '../testable_widget_sample.dart';
import 'golden_image.dart';

class MockAlbumBloc extends MockBloc<AlbumEvent, AlbumBlocState>
    implements AlbumBloc {}

void main() {
  setUp(() {});

  group('BestAlbumList Widget Tests', () {
    late MockAlbumBloc mockAlbumBloc;
    late String image;
    setUp(() {
      mockAlbumBloc = MockAlbumBloc();
      image = returnTestImage();
    });
    testWidgets('renders loading state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loading state
      when(() => mockAlbumBloc.state).thenReturn(
          const LoadingAlbumBlocState()); // Stub state instead of initialState

      whenListen<AlbumBlocState>(
        mockAlbumBloc,
        Stream<AlbumBlocState>.fromIterable([
          const LoadingAlbumBlocState(),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AlbumBloc>(
            create: (context) => mockAlbumBloc,
            child: const BestAlbumList(),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Loading state is rendered
      expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);
    });

    testWidgets('renders error state', (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Error state
      when(() => mockAlbumBloc.state).thenReturn(
          const ErrorAlbumBlocState()); // Stub state instead of initialState

      whenListen<AlbumBlocState>(
        mockAlbumBloc,
        Stream<AlbumBlocState>.fromIterable([
          const ErrorAlbumBlocState(),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AlbumBloc>(
            create: (context) => mockAlbumBloc,
            child: TestableWidget()
                .makeTestableWidget(child: const BestAlbumList()),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Error state is rendered
      expect(find.byType(NoResultsWidget), findsOneWidget);
    });

    testWidgets('renders loaded state for wider widths',
        (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loaded state
      when(() => mockAlbumBloc.state).thenReturn(LoadedAlbumBlocState(
          data: _createTestList(image))); // Stub state instead of initialState

      whenListen<AlbumBlocState>(
        mockAlbumBloc,
        Stream<AlbumBlocState>.fromIterable([
          LoadedAlbumBlocState(data: _createTestList(image)),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AlbumBloc>(
            create: (context) => mockAlbumBloc,
            child: TestableWidget()
                .makeTestableWidget(child: const BestAlbumList()),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Loaded state is rendered
      expect(find.byType(BestAlbumListBody), findsOneWidget);
      expect(find.byType(ListView), findsNothing);
      expect(find.byType(GridView), findsOneWidget);
    });
    testWidgets('renders loaded state for narrow width',
        (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit Loaded state
      when(() => mockAlbumBloc.state).thenReturn(LoadedAlbumBlocState(
          data: _createTestList(image))); // Stub state instead of initialState

      whenListen<AlbumBlocState>(
        mockAlbumBloc,
        Stream<AlbumBlocState>.fromIterable([
          LoadedAlbumBlocState(data: _createTestList(image)),
        ]),
      );

      // Set the screen size with the desired width
      tester.view.physicalSize = const Size(300, 400);
      tester.view.devicePixelRatio = 1.0;

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AlbumBloc>(
            create: (context) => mockAlbumBloc,
            child: TestableWidget()
                .makeTestableWidget(child: const BestAlbumList()),
          ),
        ),
      );
      await tester.pump(Duration.zero);
      // Verify that the narrow content is rendered
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(GridView), findsNothing);
    });

    testWidgets('test gestureDectector tap', (WidgetTester tester) async {
      final image = returnTestImage();

      final mockGoRouter = MockGoRouter();
      final goRouterUrl = Uri(
        path: '/${Routes().albumDetail}1',
        queryParameters: {'image': image, 'title': 'Title', 'artist': 'Artist'},
      ).toString();
      // Stub the behavior of the bloc to emit Loaded state
      when(() => mockAlbumBloc.state)
          .thenReturn(LoadedAlbumBlocState(data: _createTestList(image)));
      when(() => mockGoRouter.push(goRouterUrl))
          .thenAnswer((_) => Future<void>.value());

      whenListen<AlbumBlocState>(
        mockAlbumBloc,
        Stream<AlbumBlocState>.fromIterable([
          LoadedAlbumBlocState(data: _createTestList(image)),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AlbumBloc>(
            create: (context) => mockAlbumBloc,
            child: TestableWidget().makeTestableWidget(
                child: MockGoRouterProvider(
                    goRouter: mockGoRouter, child: const BestAlbumList())),
          ),
        ),
      );
      await tester.pump(Duration.zero);
      // Act: Simulate a tap on the GestureDetector
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pump(Duration.zero);

      // Assert: Verify that the navigation occurred
      verify(() => mockGoRouter.push(goRouterUrl)).called(1);
    });
  });
}

List<BestAlbum> _createTestList(String image) {
  return [
    BestAlbum(
      id: 1,
      image: image,
      artist: 'Artist',
      title: 'Title',
      // detailAlbum: 1,
      type: 'album',
    ),
    BestAlbum(
        id: 1,
        image: image,
        artist: 'Artist',
        title: 'Title',
        // detailAlbum: 1,
        type: 'album')
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

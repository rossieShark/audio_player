import 'dart:io';
import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/ui/widgets/screens/index.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import '../firebase.dart';
import '../testable_widget_sample.dart';

class MockTabBarBloc extends MockCubit<int> implements TabBarBloc {}

class MockMusicBloc extends MockBloc<MusicEvent, MusicState>
    implements MusicBloc {}

class MockNewPlaylist extends MockBloc<NewPlaylistBlocEvent, NewPlaylistState>
    implements NewPlaylistBloc {}

void main() {
  // Setup Firebase authentication mocks
  setupFirebaseAuthMocks();

  // Setup Firebase initialization for all tests
  setUpAll(() async {
    await Firebase.initializeApp();
  });
  group('WebTabBar Widget Tests', () {
    late MockTabBarBloc mockBloc;
    late MockMusicBloc musicBloc;

    setUp(() {
      mockBloc = MockTabBarBloc();
      musicBloc = MockMusicBloc();
    });
    testWidgets('TabBarContent widget test for narrow screen width',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(300, 400);
      tester.view.devicePixelRatio = 1.0;
      // Build the MobileTabBar widget.
      when(() => mockBloc.state).thenReturn(1);
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<TabBarBloc>(
                create: (context) => mockBloc,
              ),
              BlocProvider<MusicBloc>(
                create: (context) => musicBloc,
              ),
              // BlocProvider<NewPlaylistBloc>(
              //   create: (context) => newPlaylistBloc,
              // ),
            ],
            child: TestableWidget().makeTestableWidget(
              child: TabBarContent(
                child: Container(),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(MobileTabBar), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border_outlined), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.search), findsOneWidget);
      expect(find.byType(CustomAnimatedContainer), findsOneWidget);
    });

    testWidgets('TabBarContent widget test for wider screen width',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(900, 400);
      tester.view.devicePixelRatio = 1.0;
      // Build the MobileTabBar widget.
      when(() => mockBloc.state).thenReturn(1);
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<TabBarBloc>(
                create: (context) => mockBloc,
              ),
              BlocProvider<MusicBloc>(
                create: (context) => musicBloc,
              ),
            ],
            child: TestableWidget().makeTestableWidget(
              child: TabBarContent(
                child: Container(),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(IPadTabBar), findsOneWidget);
      expect(find.byType(IPadTabBar), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(NavigationRail), findsOneWidget);
      expect(find.byType(WillPopScope), findsOneWidget);
    });

    testWidgets('TabBarContent widget test for different platforms',
        (WidgetTester tester) async {
      // Build the MobileTabBar widget.
      when(() => mockBloc.state).thenReturn(1);
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<TabBarBloc>(
                create: (context) => mockBloc,
              ),
              BlocProvider<MusicBloc>(
                create: (context) => musicBloc,
              ),
            ],
            child: TestableWidget().makeTestableWidget(
              child: TabBarContent(
                child: Container(),
              ),
            ),
          ),
        ),
      );

      if (kIsWeb) {
        expect(find.byType(WebTabBar), findsOneWidget);
      } else if (Platform.isIOS) {
        expect(find.byType(IPadTabBar), findsOneWidget);
      }
    });
  });
  group('WebTabBar Widget Tests', () {
    late MockTabBarBloc mockBloc;
    late MockMusicBloc musicBloc;
    late MockNewPlaylist newPlaylistBloc;
    setUp(() {
      mockBloc = MockTabBarBloc();
      musicBloc = MockMusicBloc();
      newPlaylistBloc = MockNewPlaylist();
    });
    testWidgets('WebTabBar widget test', (WidgetTester tester) async {
      when(() => musicBloc.state).thenReturn(
        MusicState(
          playlist: [],
          currentSongIndex: -1,
          currentSongId: -1,
          isPlaying: false,
        ),
      );
      when(() => newPlaylistBloc.state)
          .thenReturn(const NewPlaylistState.empty());
      // Build the WebTabBar widget.
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<TabBarBloc>(
                create: (context) => mockBloc,
              ),
              BlocProvider<MusicBloc>(
                create: (context) => musicBloc,
              ),
              BlocProvider<NewPlaylistBloc>(
                create: (context) => newPlaylistBloc,
              ),
            ],
            child: TestableWidget().makeTestableWidget(
              child: WebTabBar(
                tabIndex: 1,
                child: Container(),
              ),
            ),
          ),
        ),
      );

      await tester.pump(Duration.zero);
      // Verify that the widget is initially displayed.
      expect(find.byType(WebTabBar), findsOneWidget);
      expect(find.byType(MyMusicPage), findsOneWidget);
      expect(find.byType(NavigationRail), findsOneWidget);
    });
  });
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
  Widget build(BuildContext context) => InheritedGoRouter(
        goRouter: goRouter,
        child: child,
      );
}

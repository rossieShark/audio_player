import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/ui/widgets/screens/home_screen/home_screen_index.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

import 'golden_image.dart';

class MockFavoriteArtistBloc
    extends MockBloc<FavoriteArtistEvent, FavoriteArtistBlocState>
    implements FavoriteArtistBloc {}

void main() {
  setUp(() {});

  group('FavoriteArtistList Widget Tests', () {
    testWidgets('renders loading state', (WidgetTester tester) async {
      // Create a mock of your FavoriteArtistBloc
      final mockBloc = MockFavoriteArtistBloc();

      // Stub the behavior of the bloc to emit Loading state
      when(() => mockBloc.state).thenReturn(
          const LoadingFavoriteArtistBlocState()); // Stub state instead of initialState

      whenListen<FavoriteArtistBlocState>(
        mockBloc,
        Stream<FavoriteArtistBlocState>.fromIterable([
          const LoadingFavoriteArtistBlocState(),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<FavoriteArtistBloc>(
            create: (context) => mockBloc,
            child: const FavoriteArtistWidget(),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Loading state is rendered
      expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);
    });

    testWidgets('renders error state', (WidgetTester tester) async {
      // Create a mock of your FavoriteArtistBloc
      final mockBloc = MockFavoriteArtistBloc();

      // Stub the behavior of the bloc to emit Error state
      when(() => mockBloc.state).thenReturn(
          const ErrorFavoriteArtistBlocState()); // Stub state instead of initialState

      whenListen<FavoriteArtistBlocState>(
        mockBloc,
        Stream<FavoriteArtistBlocState>.fromIterable([
          const ErrorFavoriteArtistBlocState(),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<FavoriteArtistBloc>(
            create: (context) => mockBloc,
            child: makeTestableWidget(child: const FavoriteArtistWidget()),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Error state is rendered
      expect(find.byType(NoResultsWidget), findsOneWidget);
    });

    testWidgets('renders loaded state for wider widths',
        (WidgetTester tester) async {
      final image = returnTestImage();

      // Create a mock of your FavoriteArtistBloc
      final mockBloc = MockFavoriteArtistBloc();

      // Stub the behavior of the bloc to emit Loaded state
      when(() => mockBloc.state).thenReturn(LoadedFavoriteArtistBlocState(
          data: _createTestList(image))); // Stub state instead of initialState

      whenListen<FavoriteArtistBlocState>(
        mockBloc,
        Stream<FavoriteArtistBlocState>.fromIterable([
          LoadedFavoriteArtistBlocState(data: _createTestList(image)),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<FavoriteArtistBloc>(
            create: (context) => mockBloc,
            child: makeTestableWidget(child: const FavoriteArtistWidget()),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Loaded state is rendered
      expect(find.byType(FavouriteArtistBody), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Stack), findsOneWidget);
      expect(find.byType(CreateScrollButtons), findsOneWidget);
      expect(find.byType(FavoriteListContent), findsWidgets);
    });
  });
}

Widget makeTestableWidget({required Widget child}) {
  return MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: const Locale('en'),
      home: child,
    ),
  );
}

List<FavoriteArtist> _createTestList(String image) {
  return [
    FavoriteArtist(id: 1, image: image, name: 'name'),
    FavoriteArtist(
      id: 2,
      image: image,
      name: 'name',
    )
  ];
}

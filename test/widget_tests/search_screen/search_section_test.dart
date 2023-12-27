import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/domain/entity/search_result/search_result_model.dart';
import 'package:audio_player/app/ui/widgets/screens/search_screen/bloc_loaded_state/search_section.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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
  group('CreateSearchSection Widget Tests', () {
    late MockDetailMusicPageBloc mockBloc;
    late String image;

    setUp(() {
      mockBloc = MockDetailMusicPageBloc();
      image = returnTestImage();
    });

    testWidgets('renders loading state for narrow screen',
        (WidgetTester tester) async {
      // Set the screen size for a narrow screen
      tester.view.physicalSize = const Size(300, 400);
      tester.view.devicePixelRatio = 1.0;

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<SearchResultBloc>(
                create: (context) => mockBloc,
              ),
            ],
            child: MaterialApp(
              home: Scaffold(
                body: TestableWidget().makeTestableWidget(
                  child: CreateSearchSection(
                    textFieldController: TextEditingController(),
                    scrollController: ScrollController(),
                    searchResult: _createSearchData(image),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Loading state is rendered
      expect(find.byType(NarrowSearchSection), findsOneWidget);
      expect(find.byType(WideSearchSection), findsNothing);
    });

    testWidgets('renders loading state for wider screen',
        (WidgetTester tester) async {
      // Set the screen size for a wider screen
      tester.view.physicalSize = const Size(800, 400);
      tester.view.devicePixelRatio = 1.0;

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<SearchResultBloc>(
                create: (context) => mockBloc,
              ),
            ],
            child: MaterialApp(
              home: Scaffold(
                body: TestableWidget().makeTestableWidget(
                  child: CreateSearchSection(
                    textFieldController: TextEditingController(),
                    scrollController: ScrollController(),
                    searchResult: _createSearchData(image),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Loading state is rendered
      expect(find.byType(NarrowSearchSection), findsNothing);
      expect(find.byType(WideSearchSection), findsOneWidget);
    });
  });
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

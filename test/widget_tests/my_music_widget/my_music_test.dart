import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_folders/albums_tracks_list.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_screen.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/new_playlist/new_folder.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/new_playlist/new_playlist_list.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/widgets/playlist_card.dart';
import 'package:audio_player/ui/widgets/widgets/custom_buttons/platform_response_button.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../firebase.dart';

import '../testable_widget_sample.dart';

class MockNewPlaylistBloc
    extends MockBloc<NewPlaylistBlocEvent, NewPlaylistState>
    implements NewPlaylistBloc {}

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('MyMusicPage Widget Tests', () {
    late MockNewPlaylistBloc mockBloc;

    setUp(() {
      mockBloc = MockNewPlaylistBloc();
    });

    testWidgets('MyMusicPage test with empty NewPlaylist',
        (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit EmptyNewPlaylistState
      when(() => mockBloc.state).thenReturn(
          const EmptyNewPlaylistState()); // Stub state instead of initialState

      whenListen<NewPlaylistState>(
        mockBloc,
        Stream<NewPlaylistState>.fromIterable([
          const EmptyNewPlaylistState(),
        ]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        BlocProvider<NewPlaylistBloc>(
          create: (context) => mockBloc,
          child:
              TestableWidget().makeTestableWidget(child: const MyMusicPage()),
        ),
      );

      await tester.pump(Duration.zero);

      // Verify that the EmptyNewPlaylistState is rendered
      expect(find.byType(IconButtonWidget), findsWidgets);
      expect(find.byType(MobileMyMusicBody), findsOneWidget);
      expect(find.byType(AlbumTracksListView), findsOneWidget);
      expect(find.byType(NewFoldersBlocBuilder), findsOneWidget);
      expect(find.byType(PlaylistCard), findsNWidgets(2));

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.byType(AddNewPlaylist), findsOneWidget);
    });

    testWidgets('MyMusicPage test with loaded NewPlaylist',
        (WidgetTester tester) async {
      // Stub the behavior of the bloc to emit LoadedNewPlaylistState
      when(() => mockBloc.state)
          .thenReturn(LoadedNewPlaylistState(folders: _createFoldersList()));

      whenListen<NewPlaylistState>(
        mockBloc,
        Stream<NewPlaylistState>.fromIterable(
            [LoadedNewPlaylistState(folders: _createFoldersList())]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        BlocProvider<NewPlaylistBloc>(
          create: (context) => mockBloc,
          child:
              TestableWidget().makeTestableWidget(child: const MyMusicPage()),
        ),
      );

      await tester.pump(Duration.zero);

      // Verify that the LoadedNewPlaylistState is rendered
      expect(find.byType(IconButtonWidget), findsWidgets);
      expect(find.byType(MobileMyMusicBody), findsOneWidget);
      expect(find.byType(AlbumTracksListView), findsOneWidget);
      expect(find.byType(NewFolddersListView), findsOneWidget);
      expect(find.byType(PlaylistCard), findsNWidgets(3));
    });
  });
}

List<FavoriteFolder> _createFoldersList() {
  return [FavoriteFolder(image: AppImages.playlist, title: "Playlist")];
}

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/ui/widgets/screens/home_screen/home_screen_index.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../home_screen/golden_image.dart';

class MockMusicBloc extends MockBloc<MusicEvent, MusicState>
    implements MusicBloc {}

void main() {
  group('Basic Goldens', () {
    testGoldens('RecentlyPlayedPageContent widget medium', (tester) async {
      final musicBloc = MockMusicBloc();
      await loadAppFonts();
      final image = returnTestImage();
      when(() => musicBloc.state).thenReturn(MusicState(
          playlist: [],
          currentSongIndex: 0,
          currentSongId: 0,
          isPlaying: false));
      // Build the FavoriteListContent widget with the bestAlbumList.
      await tester.pumpWidgetBuilder(
        MaterialApp(
          home: Scaffold(
            backgroundColor: AppColors.background.color,
            body: MultiBlocProvider(
              providers: [
                // BlocProvider<RecentlyPlayedBloc>(
                //   create: (context) => mockBloc,
                // ),
                BlocProvider<MusicBloc>(
                  create: (context) => musicBloc,
                )
              ],
              child: RecentlyPlayedPageContent(
                image: image,
                artistName: 'Fauve',
                title: 'Kane',
                preview: '',
                id: 1,
                isHovered: false,
              ),
            ),
          ),
        ),
        wrapper: materialAppWrapper(),
        surfaceSize: const Size(250, 250),
      );

      await screenMatchesGolden(
          tester, 'recentlyPlayedPageContent golden medium');
    });
  });
}

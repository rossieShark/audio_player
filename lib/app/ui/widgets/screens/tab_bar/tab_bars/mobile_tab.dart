import 'package:audio_player/app/app_logic/blocs/music_bloc/music_bloc.dart';
import 'package:audio_player/app/app_logic/blocs/music_bloc/music_bloc_state.dart';
import 'package:audio_player/app/ui/widgets/screens/detail_music_screen/mini_player/mini_player_small_widget.dart';
import 'package:audio_player/app/ui/widgets/screens/detail_music_screen/mini_player/mini_player_large_widget.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/app/ui/navigation/navigation_routes.dart';
import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';

class MobileTabBar extends StatelessWidget {
  const MobileTabBar({super.key, required this.tabIndex, required this.child});

  final int tabIndex;
  final Widget child;
  static const double _playerMinHeight = 60.0;
  @override
  Widget build(BuildContext context) {
    bool isHomePage(int tabIndex) {
      return tabIndex == 1;
    }

    return Scaffold(
      body: Stack(
        children: [
          child,
          BlocBuilder<MusicBloc, MusicState?>(builder: (context, state) {
            return Offstage(
              offstage:
                  state?.currentSongId == null || state?.currentSongId == -1,
              child: Miniplayer(
                  minHeight: _playerMinHeight,
                  maxHeight: MediaQuery.of(context).size.height - 200,
                  builder: (height, percentage) {
                    if (height == _playerMinHeight) {
                      return const MiniPlayerSmallWidget();
                    } else {
                      return MiniPlayerLargeWidget(
                        param: state!.currentSongId.toString(),
                        height: height,
                      );
                    }
                  }),
            );
          })
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: isHomePage(tabIndex) ? false : true,
          showUnselectedLabels: tabIndex == 1 ? false : true,
          useLegacyColorScheme: false,
          currentIndex: tabIndex,
          onTap: (index) => _navigationRails(context, index),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.favorite_border_outlined,
              ),
              label: AppLocalizations.of(context)!.tabBarMyMusic,
            ),
            const BottomNavigationBarItem(
              icon: CustomAnimatedContainer(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                CupertinoIcons.search,
              ),
              label: AppLocalizations.of(context)!.tabBarSearch,
            ),
          ]),
    );
  }

  void _navigationRails(BuildContext context, int index) {
    NavigationUtils.mobileHandleTabTap(context, index);
  }
}

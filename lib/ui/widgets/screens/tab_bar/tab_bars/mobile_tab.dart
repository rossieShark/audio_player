import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileTabBar extends StatelessWidget {
  const MobileTabBar({super.key, required this.tabIndex, required this.child});

  final int tabIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    bool isHomePage(int tabIndex) {
      return tabIndex == 1;
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: isHomePage(tabIndex) ? false : true,
          showUnselectedLabels: tabIndex == 1 ? false : true,
          backgroundColor: AppColors.background.color,
          selectedIconTheme: IconThemeData(color: AppColors.accent.color),
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(color: AppColors.accent.color),
          unselectedIconTheme: IconThemeData(color: AppColors.white.color),
          unselectedLabelStyle: TextStyle(color: AppColors.white.color),
          selectedItemColor: Colors.transparent,
          unselectedItemColor: Colors.transparent,
          useLegacyColorScheme: false,
          currentIndex: tabIndex,
          onTap: (index) {
            NavigationUtils.mobileHandleTabTap(context, index);
          },
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
}

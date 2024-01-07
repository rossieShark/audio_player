import 'package:audio_player/app/ui/widgets/screens/detail_music_screen/mini_player/mini_player_widget.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/app/ui/navigation/navigation_routes.dart';

import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IPadTabBar extends StatelessWidget {
  const IPadTabBar({super.key, required this.tabIndex, required this.child});

  final int tabIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
              selectedIndex: tabIndex,
              onDestinationSelected: (int index) =>
                  _navigationRails(context, index),
              destinations: _createDestinations(context)),
          VerticalDivider(
            thickness: 1,
            width: 1,
            color: AppColors.white.color,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  child,
                  const MiniPlayerWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigationRails(BuildContext context, int index) {
    NavigationUtils.mobileHandleTabTap(context, index);
  }

  List<NavigationRailDestination> _createDestinations(BuildContext context) {
    return [
      DestinationData(const Icon(Icons.favorite_border_outlined),
          AppLocalizations.of(context)!.tabBarSearch),
      DestinationData(const CustomAnimatedContainer(), ''),
      DestinationData(const Icon(CupertinoIcons.search),
          AppLocalizations.of(context)!.tabBarMyMusic),
    ];
  }
}

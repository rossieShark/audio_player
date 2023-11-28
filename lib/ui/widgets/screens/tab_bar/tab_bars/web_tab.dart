import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';

import 'package:audio_player/ui/widgets/screens/index.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class WebTabBar extends StatefulWidget {
  final int tabIndex;
  final Widget child;
  const WebTabBar({super.key, required this.tabIndex, required this.child});

  @override
  WebTabBarState createState() => WebTabBarState();
}

class WebTabBarState extends State<WebTabBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black.color,
      body: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 100,
          child: Row(
            children: [
              _NavigationRailWidget(widget: widget),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
            height: 100,
            child: const WebDetailMusicPage().createWithMultiProviders([
              BlocProvider<DetailMusicPageBloc>(
                create: (blocContext) => GetIt.I.get(),
              ),
              BlocProvider<FavoriteBloc>(
                create: (context) => GetIt.I.get(),
              ),
            ])),
      ]),
    );
  }
}

class _NavigationRailWidget extends StatelessWidget {
  const _NavigationRailWidget({
    required this.widget,
  });

  final WebTabBar widget;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        narrow: MediaQuery.of(context).size.width / 2.6,
        medium: MediaQuery.of(context).size.width / 3,
        large: MediaQuery.of(context).size.width / 4.5,
        builder: (context, child, width) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 160,
                        child: NavigationRail(
                          selectedIndex: widget.tabIndex,
                          onDestinationSelected: (int index) =>
                              onDestinationSelected(context, index),
                          destinations: _createDestinations(context),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const MyMusicPage())),
                  )
                ],
              ),
            ),
          );
        });
  }

  List<NavigationRailDestination> _createDestinations(BuildContext context) {
    return [
      DestinationData(const Icon(CupertinoIcons.search),
          AppLocalizations.of(context)!.tabBarSearch),
      DestinationData(const Icon(CupertinoIcons.home),
          AppLocalizations.of(context)!.homePageTitle),
    ];
  }

  void onDestinationSelected(BuildContext context, int index) {
    NavigationUtils.WebHandleTabTap(context, index);
  }
}

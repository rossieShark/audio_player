import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_folders/albums_tracks_list.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_index.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/new_playlist/new_playlist_list.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyMusicPage extends StatefulWidget {
  const MyMusicPage({super.key});

  @override
  State<MyMusicPage> createState() => _MyMusicPageState();
}

class _MyMusicPageState extends State<MyMusicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        shadowColor: AppColors.black.color,
        elevation: 1.0,
        backgroundColor: AppColors.background.color,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            AppLocalizations.of(context)!.tabBarMyMusic,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        leading: IconButtonWidget(
            iconData: Icons.splitscreen,
            color: AppColors.accent.color,
            onPressed: () {}),
        actions: [
          IconButtonWidget(
            iconData: Icons.add,
            color: AppColors.accent.color,
            onPressed: () => showModalBottomSheet(
              constraints: const BoxConstraints(maxWidth: 400),
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const AddNewPlaylist(),
            ),
          ),
          PlatformBuilder(
              web: Container(),
              other: IconButtonWidget(
                  iconData: Icons.settings,
                  color: AppColors.accent.color,
                  onPressed: () {
                    context.push('/${Routes().settings}');
                  }),
              builder: (context, child, widget) {
                return widget;
              }),
        ],
      ),
      body: PlatformBuilder(
          web: const WebMyMusicBody(),
          other: const MobileMyMusicBody(),
          builder: (context, child, widget) {
            return widget;
          }),
    );
  }
}

class MobileMyMusicBody extends StatelessWidget {
  const MobileMyMusicBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserInfoWidget(),
        Container(
          height: 10,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.accent.color, width: 1),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: AlbumTracksListView(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: NewFoldersBlocBuilder(),
        ),
      ],
    );
  }
}

class WebMyMusicBody extends StatelessWidget {
  const WebMyMusicBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: AlbumTracksListView(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: NewFoldersBlocBuilder(),
        ),
      ],
    );
  }
}

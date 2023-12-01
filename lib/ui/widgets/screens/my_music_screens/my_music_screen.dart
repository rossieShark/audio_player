import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_index.dart';

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
              builder: (context) => const NewFolder(),
            ),
          ),
          PlatformBuilder(
              web: Container(),
              other: IconButtonWidget(
                  iconData: Icons.settings,
                  color: AppColors.accent.color,
                  onPressed: () {
                    context.push('/${routeNameMap[RouteName.settings]!}');
                  }),
              builder: (context, child, widget) {
                return widget;
              }),
        ],
      ),
      body: PlatformBuilder(
          web: const Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: _MyFavoriteListView(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: _NewFoldersBlocBuilder(),
              ),
            ],
          ),
          other: Column(
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
                child: _MyFavoriteListView(),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: _NewFoldersBlocBuilder(),
              ),
            ],
          ),
          builder: (context, child, widget) {
            return widget;
          }),
    );
  }
}

class _MyFavoriteListView extends StatelessWidget {
  const _MyFavoriteListView();

  @override
  Widget build(BuildContext context) {
    List<FavoriteFolder> folders = initializeFolders(context);
    return SizedBox(
      height: 60 * folders.length.toDouble(),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: folders.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            List<FavoriteFolder> folders = initializeFolders(context);
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  GoRouter.of(context)
                      .push('/${routeNameMap[RouteName.favoriteAlbums]!}');
                } else {
                  GoRouter.of(context)
                      .push('/${routeNameMap[RouteName.favoriteTracks]!}');
                }
              },
              child: _FavouritefoldersCard(index: index, folders: folders),
            );
          }),
    );
  }
}

class _FavouritefoldersCard extends StatelessWidget {
  const _FavouritefoldersCard({required this.index, required this.folders});
  final int index;
  final List<FavoriteFolder> folders;
  @override
  Widget build(BuildContext context) {
    return HoverableWidget(builder: (context, child, isHovered) {
      return SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width - 32,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                        width: 45,
                        height: 45,
                        child: Image.asset(folders[index].image,
                            fit: BoxFit.cover))),
              ),
              Text(
                folders[index].title,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontFamily.lusitana,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ]),
      );
    });
  }
}

List<FavoriteFolder> initializeFolders(BuildContext context) {
  return [
    FavoriteFolder(
      image: AppImages.album,
      title: AppLocalizations.of(context)!.albumsFolder,
    ),
    FavoriteFolder(
      image: AppImages.track,
      title: AppLocalizations.of(context)!.tracksFolder,
    ),
  ];
}

class _NewFoldersBlocBuilder extends StatelessWidget {
  // final List<FavoriteFolder> folders;
  const _NewFoldersBlocBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyMusicFolderBlocBloc, MyMusicFolderState>(
        builder: (context, state) {
      return state.map(
        empty: (context) => const SizedBox(),
        loaded: (folders) => _NewFolddersListView(
          folders: folders.folders,
        ),
      );
    });
  }
}

class _NewFolddersListView extends StatelessWidget {
  final List<FavoriteFolder> folders;
  const _NewFolddersListView({
    required this.folders,
  });

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(builder: (context, child, isHovered) {
      print(folders.length);
      return SizedBox(
        height: 60 * folders.length.toDouble(),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: folders.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: _FavouritefoldersCard(index: index, folders: folders),
              );
            }),
      );
    });
  }
}

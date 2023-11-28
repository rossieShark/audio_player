import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/screens/home_screen/home_screen_index.dart';
import 'package:audio_player/ui/widgets/screens/search_screen/bloc_no_results_state/no_results_widget.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButtonWidget(
          iconData: Icons.search,
          color: AppColors.accent.color,
          onPressed: () {
            context.go(routeNameMap[RouteName.search]!);
          },
        ),
        actions: [
          IconButtonWidget(
              iconData: Icons.ios_share,
              color: AppColors.accent.color,
              onPressed: () {}),
          IconButtonWidget(
              iconData: Icons.settings,
              color: AppColors.accent.color,
              onPressed: () {
                context.push('/${routeNameMap[RouteName.settings]!}');
              })
        ],
      ),
      body: _BuildMainSection(),
    );
  }
}

class _BuildMainSection extends StatefulWidget {
  @override
  State<_BuildMainSection> createState() => _BuildMainSectionState();
}

class _BuildMainSectionState extends State<_BuildMainSection> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _scrollListener();
    });
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent - 200) {
      final albumBloc = BlocProvider.of<AlbumBloc>(context);
      albumBloc.add(FetchAlbumsEvent());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: PlatformBuilder(
          web: Column(
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
              _BuildRecentlyPlayedSection(),
              _BuildFavoriteArtistSection(),
              const SizedBox(
                height: 15,
              ),
              _BuildBestAlbumsSection(),
            ],
          ),
          other: Column(
            children: [
              _BuildRecentlyPlayedSection(),
              _BuildFavoriteArtistSection(),
              const SizedBox(
                height: 15,
              ),
              _BuildBestAlbumsSection(),
            ],
          ),
          builder: (context, child, widget) {
            return widget;
          }),
    );
  }
}

class _BuildRecentlyPlayedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            AppLocalizations.of(context)!.recentlyPlayed,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ResponsiveBuilder(
          narrow: 266.0,
          medium: 285.0,
          large: 300.0,
          builder: (context, child, height) {
            return SizedBox(
              height: height,
              child: child,
            );
          },
          child: const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: RecentlyPlayedList()),
        )
      ],
    );
  }
}

class _BuildFavoriteArtistSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Text(AppLocalizations.of(context)!.favouriteArtists,
            style: Theme.of(context).textTheme.titleMedium),
      ),
      ResponsiveBuilder(
        narrow: 107.0,
        medium: 141.0,
        large: 160.0,
        builder: (context, child, height) {
          return SizedBox(
            height: height,
            child: child,
          );
        },
        child: const FavoriteArtistList(),
      )
    ]);
  }
}

class _BuildBestAlbumsSection extends StatefulWidget {
  @override
  State<_BuildBestAlbumsSection> createState() =>
      _BuildBestAlbumsSectionState();
}

class _BuildBestAlbumsSectionState extends State<_BuildBestAlbumsSection> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlbumBloc>(context).add(FetchAlbumsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
          child: Text(AppLocalizations.of(context)!.bestAlbums,
              style: Theme.of(context).textTheme.titleMedium),
        ),
        BlocBuilder<AlbumBloc, AlbumState>(builder: (context, state) {
          return state.map(
            error: (context) => const NoResultsWidget(),
            loading: (context) => const Center(
              child: CustomFadingCircleIndicator(),
            ),
            loaded: (data) => BestAlbumList(bestAlbumList: data.data),
          );
        })
      ],
    );
  }
}

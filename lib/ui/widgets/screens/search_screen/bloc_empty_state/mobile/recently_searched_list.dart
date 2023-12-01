import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecentlySearchedList extends StatelessWidget {
  final double width;
  const RecentlySearchedList({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentlySearchedBloc, RecentlySearchedState>(
        builder: (context, state) {
      return state.map(
        loading: (context) =>
            const Center(child: CustomFadingCircleIndicator()),
        empty: (context) => _CreateListEmptyState(width: width),
        loaded: (data) =>
            _CreateListView(width: width, recentlySearched: data.data),
      );
    });
  }
}

class _CreateListView extends StatelessWidget {
  final List<SongModel> recentlySearched;
  const _CreateListView({required this.width, required this.recentlySearched});

  final double width;

  @override
  Widget build(BuildContext context) {
    const double tabBarWidth = 51;
    const double padding = 16;
    const double listHeight = 70;
    return ResponsiveBuilder(
        narrow: width,
        medium: width - tabBarWidth,
        large: width - tabBarWidth,
        builder: (context, child, widthVal) {
          return SizedBox(
            width: widthVal,
            height:
                recentlySearched.length.toDouble() * listHeight + padding * 6,
            child: ListView.separated(
                itemCount: recentlySearched.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final song = recentlySearched[index];

                  return GestureDetector(
                    onTap: () {
                      String id = song.id;
                      GoRouter.of(context).push(Uri(
                              path:
                                  '/${routeNameMap[RouteName.detailMusic]!}$id')
                          .toString());
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: CustomListViewContent(
                        imageSection: _CreateImageSection(
                            listHeight: listHeight, song: song),
                        titleSection: CreateSongTitle(
                            artistName: song.artistNames,
                            songTitle: song.title),
                      ),
                    ),
                  );
                }),
          );
        });
  }
}

class _CreateImageSection extends StatelessWidget {
  const _CreateImageSection({
    required this.listHeight,
    required this.song,
  });

  final double listHeight;
  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: listHeight,
          height: listHeight,
          child: Image.network(
            song.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _CreateListEmptyState extends StatelessWidget {
  const _CreateListEmptyState({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    const double tabBarWidth = 51;
    return ResponsiveBuilder(
      narrow: width,
      medium: width - tabBarWidth,
      large: width - tabBarWidth,
      builder: (context, child, widthVal) {
        return SizedBox(
            width: widthVal,
            height: MediaQuery.of(context).size.height,
            child: child);
      },
      child: ResponsiveBuilder(
          narrow: 13.0,
          medium: 18.0,
          large: 18.0,
          builder: (context, child, size) {
            return Text(
              AppLocalizations.of(context)!.searchHistoryResultText,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamily.lusitana,
                  fontSize: size,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            );
          }),
    );
  }
}

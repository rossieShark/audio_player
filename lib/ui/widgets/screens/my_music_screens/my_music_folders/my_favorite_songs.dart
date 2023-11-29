import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app_logic/blocs/favourites_bloc/favourite_song_bloc/favourites_song_bloc.dart';
import 'package:audio_player/app_logic/blocs/favourites_bloc/favourite_song_bloc/favourites_song_event.dart';
import 'package:audio_player/app_logic/blocs/favourites_bloc/favourite_song_bloc/favourites_song_states.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';

import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/screens/index.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_index.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyFavoriteSongs extends StatefulWidget {
  const MyFavoriteSongs({super.key});

  @override
  State<MyFavoriteSongs> createState() => _MyFavoriteSongsState();
}

class _MyFavoriteSongsState extends State<MyFavoriteSongs> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<FavoriteSongBloc>();
    bloc.add(const LoadFavouriteSongsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const FavoritePageStructure(
      child: FavoriteSongListView(),
    );
  }
}

class FavoriteSongListView extends StatefulWidget {
  const FavoriteSongListView({
    super.key,
  });

  @override
  State<FavoriteSongListView> createState() => _FavoriteSongListViewState();
}

class _FavoriteSongListViewState extends State<FavoriteSongListView> {
  @override
  Widget build(BuildContext context) {
    print('FavoriteSongListView rebuilt');
    return BlocBuilder<FavoriteSongBloc, FavouriteSongState>(
        builder: (context, state) {
      return state.map(
          loading: (context) => Center(child: CustomFadingCircleIndicator()),
          noResults: (context) => NoFavouritesTextWidget(),
          loaded: (data) => _CreateFavouritesSongListView(songs: data.data));
    });
  }
}

class _CreateFavouritesSongListView extends StatelessWidget {
  final List<SongModel> songs;
  const _CreateFavouritesSongListView({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: songs.length,
        separatorBuilder: (context, index) => const Divider(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final song = songs[index];
          return PlatformBuilder(
              web: GestureDetector(
                onTap: null,
                child: Dismissible(
                  key: Key(song.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: AppColors.accent.color,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    final bloc = context.read<FavoriteSongBloc>();
                    bloc.add(RemoveSongsEvent(song));
                  },
                  child: FavouriteListContent(song: song),
                ),
              ),
              other: GestureDetector(
                onTap: () {
                  String id = song.id;

                  GoRouter.of(context).push(
                      Uri(path: '/${routeNameMap[RouteName.detailMusic]!}$id')
                          .toString());
                },
                child: Dismissible(
                  key: Key(song.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: AppColors.accent.color,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    final bloc = context.read<FavoriteSongBloc>();
                    bloc.add(RemoveSongsEvent(song));
                  },
                  child: CustomListViewContent(
                    imageSection: ResponsiveBuilder(
                        narrow: 70.0,
                        medium: 90.0,
                        large: 90.0,
                        builder: (context, child, height) {
                          return CreateImageSection(song: song, height: height);
                        }),
                    titleSection: CreateSongTitle(
                      artistName: song.artistNames,
                      songTitle: song.title,
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
              builder: (context, child, widget) {
                return widget;
              });
        });
  }
}

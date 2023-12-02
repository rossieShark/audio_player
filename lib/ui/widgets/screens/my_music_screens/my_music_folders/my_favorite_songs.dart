import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';

import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/screens/index.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_folders/widgets/common_favourite_list_biew_body.dart';
import 'package:audio_player/ui/widgets/screens/my_music_screens/my_music_index.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class MyFavoriteSongs extends StatefulWidget {
//   const MyFavoriteSongs({super.key});

//   @override
//   State<MyFavoriteSongs> createState() => _MyFavoriteSongsState();
// }

// class _MyFavoriteSongsState extends State<MyFavoriteSongs> {
//   @override
//   void initState() {
//     super.initState();
//     final bloc = context.read<FavoriteSongBloc>();
//     bloc.add(const LoadFavouriteSongsEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const FavoritePageStructure(
//       child: MyFavoriteSongs(),
//     );
//   }
// }

class MyFavoriteSongs extends StatelessWidget {
  const MyFavoriteSongs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteBloc = BlocProvider.of<FavoriteSongBloc>(context);
    favoriteBloc.add(const LoadFavouriteSongsEvent());
    return FavoritePageStructure(
      child: BlocBuilder<FavoriteSongBloc, FavouriteSongState>(
          builder: (context, state) {
        return state.map(
            loading: (context) =>
                const Center(child: CustomFadingCircleIndicator()),
            noResults: (context) => const NoFavouritesTextWidget(),
            loaded: (data) => _CreateFavouritesSongListView(songs: data.data));
      }),
    );
  }
}

class _CreateFavouritesSongListView extends StatelessWidget {
  final List<SongModel> songs;
  const _CreateFavouritesSongListView({required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: songs.length,
      separatorBuilder: (context, index) => const Divider(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final song = songs[index];
        return PlatformBuilder(
          web: _WebFavouriteListViewBody(song: song),
          other: _MobileFavouriteListViewBody(song: song),
          builder: (context, child, widget) {
            return KeyedSubtree(
              key: Key(song.id), // or use a unique identifier
              child: widget,
            );
          },
        );
      },
    );
  }
}

class _MobileFavouriteListViewBody extends StatelessWidget {
  const _MobileFavouriteListViewBody({
    required this.song,
  });

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return CommonFavouriteListViewBody(
      onDismissed: () {
        final bloc = context.read<FavoriteSongBloc>();
        bloc.add(RemoveSongsEvent(song));
      },
      onTap: () {
        String id = song.id;

        GoRouter.of(context).push(
            Uri(path: '/${routeNameMap[RouteName.detailMusic]!}$id')
                .toString());
      },
      song: song,
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
    );
  }
}

class _WebFavouriteListViewBody extends StatelessWidget {
  const _WebFavouriteListViewBody({
    required this.song,
  });

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return CommonFavouriteListViewBody(
      onDismissed: () {
        final bloc = context.read<FavoriteSongBloc>();
        bloc.add(RemoveSongsEvent(song));
      },
      onTap: null,
      song: song,
      child: FavouriteListContent(song: song),
    );
  }
}

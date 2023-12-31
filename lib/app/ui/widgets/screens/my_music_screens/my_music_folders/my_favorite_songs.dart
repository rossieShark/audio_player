import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/domain/entity/models.dart';

import 'package:audio_player/app/ui/widgets/screens/index.dart';
import 'package:audio_player/app/ui/widgets/screens/my_music_screens/my_music_folders/widgets/common_favourite_list_biew_body.dart';
import 'package:audio_player/app/ui/widgets/screens/my_music_screens/my_music_index.dart';

import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

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
            loaded: (data) => CreateFavouritesSongListView(songs: data.data));
      }),
    );
  }
}

class CreateFavouritesSongListView extends StatelessWidget {
  final List<SongModel> songs;
  const CreateFavouritesSongListView({super.key, required this.songs});

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
              key: Key(song.id),
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
        _playPauseMusic(context);
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

  void _playPauseMusic(BuildContext context) {
    final musicBloc = context.read<MusicBloc>();

    musicBloc.add(PlayPause(
        song: PlayedSong(id: int.parse(song.id), preview: song.preview)));
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

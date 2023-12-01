import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreatePlayButtonSection extends StatelessWidget {
  final String param;
  final String image;
  final String title;
  final String artist;
  final List<DetailAlbum> songList;
  const CreatePlayButtonSection(
      {super.key,
      required this.param,
      required this.image,
      required this.title,
      required this.artist,
      required this.songList});

  @override
  Widget build(BuildContext context) {
    final songs = songList
        .map((song) => PlayedSong(
              id: song.id,
              preview: song.preview,
            ))
        .toList();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(children: [
          _CreateAppBarButtons(
            param: param,
            image: image,
            songList: songList,
            title: title,
            artist: artist,
          ),
          _CreatePlayPauseButton(songs: songs)
        ]),
      ),
    );
  }
}

class _CreatePlayPauseButton extends StatelessWidget {
  final List<PlayedSong> songs;
  const _CreatePlayPauseButton({required this.songs});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(builder: (context, state) {
      bool isSongPlay = state.playlist.any((song) => song.id == songs[0].id);
      return Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height / 2 - 150,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ResponsiveBuilder(
              narrow: 50.0,
              medium: 60.0,
              large: 60.0,
              builder: (context, child, height) {
                return CreatePlayButton(
                  onPressed: () => _playPauseMusic(context),
                  icon: (state.isPlaying && isSongPlay)
                      ? Icon(Icons.pause, color: AppColors.black.color)
                      : Icon(Icons.play_arrow, color: AppColors.black.color),
                  size: height,
                  containerColor: AppColors.white.color,
                );
              }),
        ),
      );
    });
  }

  void _playPauseMusic(BuildContext context) {
    //context.read<RecentlyPlayedIdCubit>().setId(songs[0].id.toString());
    final musicBloc = context.read<MusicBloc>();
    musicBloc.add(PlayPlaylist(songs: songs, song: songs[0]));
  }
}

class _CreateAppBarButtons extends StatelessWidget {
  final String param;
  final String image;
  final String title;
  final String artist;
  final List<DetailAlbum> songList;
  const _CreateAppBarButtons(
      {required this.param,
      required this.image,
      required this.songList,
      required this.title,
      required this.artist});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PlatformBuilder(
            iOS: ResponsiveButton(
                iconData: Icons.arrow_back_ios,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                color: AppColors.white.color),
            other: ResponsiveButton(
                iconData: Icons.arrow_back,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                color: AppColors.white.color),
            builder: (context, child, data) {
              return IconButtonWidget(
                  iconData: data.iconData,
                  color: data.color,
                  onPressed: data.onPressed);
            }),
        _LikeButtonWidget(param: param, songList: songList, image: image),
      ],
    );
  }
}

class _LikeButtonWidget extends StatefulWidget {
  final String param;
  final String image;
  final List<DetailAlbum> songList;
  const _LikeButtonWidget(
      {required this.param, required this.image, required this.songList});

  @override
  State<_LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<_LikeButtonWidget> {
  bool isFavorite = false;

  // void _toggleFavorite() {
  //   setState(() {
  //     isFavorite = !isFavorite;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // favoriteBloc = FavoriteBloc(
  //   //   Provider.of<FavoriteProvider>(context, listen: false),
  //   // );
  // }

  // @override
  // void didChangeDependencies() {
  //   // final favoriteProvider =
  //   //     Provider.of<FavoriteProvider>(context, listen: false);
  //   // isFavorite = favoriteProvider.isFavoriteAlbum(widget.param);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final List<DetailAlbum> songs = widget.songList;
    return BlocBuilder<FavoriteAlbumBloc, FavoriteAlbumState>(
      builder: (context, state) {
        if (state is LoadedFavoriteAlbumState) {
          isFavorite = state.data.any((album) => album.id == widget.param);
        } else {
          isFavorite = false;
        }
        return LikeButton(
            onPressed: () {
              final bloc = context.read<FavoriteAlbumBloc>();
              final album = SongModel(
                preview: songs[0].preview,
                type: 'album',
                id: widget.param,
                artistNames: songs[0].title,
                title: songs[0].artistNames,
                image: widget.image,
                isFavourite: isFavorite,
              );

              bloc.add(ToggleIsFavouriteAlbum(album: album));
            },
            isFavorite: isFavorite);
      },
    );
  }
}

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app_logic/blocs/music_bloc/music_bloc.dart';
import 'package:audio_player/app_logic/blocs/music_bloc/music_bloc_event.dart';
import 'package:audio_player/app_logic/blocs/music_bloc/music_bloc_state.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/domain/entity/played_song_model.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailAlbumListView extends StatefulWidget {
  const DetailAlbumListView({
    super.key,
    required this.songList,
    required this.image,
  });

  final String image;
  final List<DetailAlbum> songList;

  @override
  State<DetailAlbumListView> createState() => _DetailAlbumListViewState();
}

class _DetailAlbumListViewState extends State<DetailAlbumListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(widget.songList.length, (index) {
        return HoverableWidget(builder: (context, child, isHovered) {
          return _CreateListViewContent(
            preview: widget.songList[index].preview,
            image: widget.image,
            songList: widget.songList,
            index: index,
            isHovered: isHovered,
            artist: widget.songList[index].artistNames,
            id: widget.songList[index].id,
            title: widget.songList[index].title,
          );
        });
      }),
    );
  }
}

class _CreateListViewContent extends StatelessWidget {
  const _CreateListViewContent(
      {required this.index,
      required this.isHovered,
      required this.image,
      required this.preview,
      required this.songList,
      required this.artist,
      required this.title,
      required this.id});

  final List<DetailAlbum> songList;
  final String image;
  final String artist;
  final String title;
  final String preview;
  final int id;
  final int index;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final song = PlayedSong(id: id, preview: preview);
    return ResponsiveBuilder(
      narrow: 40.0,
      medium: 60.0,
      large: 60.0,
      builder: (context, child, height) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: height,
            child: child,
          ),
        );
      },
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ResponsiveBuilder(
              narrow: maxWidth / 2.8,
              medium: maxWidth / 2.3,
              large: maxWidth / 2,
              builder: (context, child, size) {
                return SizedBox(
                  width: size,
                  child: child,
                );
              },
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Center(
                      child: _CreatePlayPauseButton(
                    image: image,
                    playedSong: song,
                    isHovered: isHovered,
                  )),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: CreateSongTitle(
                  artistName: artist,
                  songTitle: title,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                )),
              ]),
            ),
            _CreateManageButtons(
                songList: songList, image: image, index: index),
          ]),
    );
  }
}

class _CreatePlayPauseButton extends StatelessWidget {
  final bool isHovered;
  final PlayedSong playedSong;
  final String image;

  const _CreatePlayPauseButton(
      {super.key,
      required this.isHovered,
      required this.playedSong,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(builder: (context, state) {
      bool isSongPlay = state.playlist.any((song) => song.id == playedSong.id);
      return PlatformBuilder(
          web: !isHovered
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                )
              : CreatePlayButton(
                  icon: state.isPlaying && isSongPlay
                      ? Icon(Icons.pause, color: AppColors.white.color)
                      : Icon(Icons.play_arrow, color: AppColors.white.color),
                  size: 30,
                  containerColor: Colors.transparent,
                  onPressed: () {
                    _playPauseMusic(context);
                    // musicProvider.musicCompleted();
                  },
                ),
          other: IconButtonWidget(
              iconData: state.isPlaying && isSongPlay
                  ? Icons.pause
                  : Icons.play_arrow,
              color: AppColors.white.color,
              onPressed: () {
                final id = playedSong.id;
                GoRouter.of(context).push(
                    Uri(path: '/${routeNameMap[RouteName.detailMusic]!}$id')
                        .toString());
                _playPauseMusic(context);
              }),
          builder: (context, child, widget) {
            return widget;
          });
    });
  }

  void _playPauseMusic(BuildContext context) {
    context.read<RecentlyPlayedIdCubit>().setId(playedSong.id.toString());
    final musicBloc = context.read<MusicBloc>();

    musicBloc.add(PlayPause(song: playedSong));
  }
}

class _CreateManageButtons extends StatelessWidget {
  const _CreateManageButtons({
    required this.songList,
    required this.index,
    required this.image,
  });

  final List<DetailAlbum> songList;
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LikeButtonWidget(
            preview: songList[index].preview,
            id: songList[index].id.toString(),
            artistNames: songList[index].artistNames,
            title: songList[index].title,
            image: image),
        const SizedBox(
          width: 10,
        ),
        IconButtonWidget(
          onPressed: () {},
          iconData: Icons.keyboard_control,
          color: Colors.white,
        ),
      ],
    );
  }
}

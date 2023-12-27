import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/domain/entity/models.dart';
import 'package:audio_player/app/ui/widgets/screens/index.dart';
import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class FavouriteListContent extends StatelessWidget {
  const FavouriteListContent({
    super.key,
    required this.song,
  });

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        narrow: 70.0,
        medium: 90.0,
        large: 90.0,
        builder: (context, child, height) {
          return SizedBox(
            height: height,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CreateImageSection(song: song, height: height),
                      ResponsiveBuilder(
                          narrow: 100.0,
                          medium: 170.0,
                          large: 300.0,
                          builder: (context, child, size) {
                            return SizedBox(
                              width: size,
                              child: CreateSongTitle(
                                artistName: song.artistNames,
                                songTitle: song.title,
                                maxLines: 2,
                              ),
                            );
                          }),
                    ],
                  ),
                  IconButtonWidget(
                      iconData: Icons.keyboard_control,
                      color: AppColors.white.color,
                      onPressed: () {}),
                ]),
          );
        });
  }
}

class CreateImageSection extends StatelessWidget {
  const CreateImageSection(
      {super.key, required this.song, required this.height});

  final SongModel song;
  final double height;

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(builder: (context, child, isHovered) {
      final radius = height / 2;
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: ClipRRect(
              borderRadius: song.type == SearchFilters.album
                  ? BorderRadius.circular(radius)
                  : BorderRadius.circular(8),
              child: SizedBox(
                width: height,
                height: height,
                child: Image.network(song.image, fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 16,
              child: (isHovered && song.type == 'track')
                  ? CreatePlayMusicFavButton(playedSong: song)
                  : Container())
        ],
      );
    });
  }
}

class CreatePlayMusicFavButton extends StatelessWidget {
  final SongModel playedSong;
  const CreatePlayMusicFavButton({
    super.key,
    required this.playedSong,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(builder: (context, state) {
      bool isSongPlay =
          state.playlist.any((song) => song.id == int.parse(playedSong.id));
      return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: AppColors.black.color.withOpacity(0.5),
            child: Center(
              child: CreatePlayButton(
                onPressed: () => _playPauseMusic(context),
                size: 45,
                icon: (state.isPlaying && isSongPlay)
                    ? Icon(Icons.pause, color: AppColors.white.color)
                    : Icon(Icons.play_arrow, color: AppColors.white.color),
                containerColor: AppColors.accent.color,
              ),
            ),
          ));
    });
  }

  void _playPauseMusic(BuildContext context) {
    final musicBloc = context.read<MusicBloc>();
    final song =
        PlayedSong(id: int.parse(playedSong.id), preview: playedSong.preview);
    musicBloc.add(PlayPause(song: song));
  }
}

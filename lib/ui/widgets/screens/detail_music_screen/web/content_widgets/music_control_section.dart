import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/databases/database.dart';
import 'package:audio_player/domain/entity/models.dart';

import 'package:audio_player/ui/widgets/screens/detail_music_screen/detail_music_index.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class MusicControlSection extends StatelessWidget {
  const MusicControlSection({
    super.key,
    required this.songInfo,
  });
  final DetailInfoSong songInfo;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CreatMusicControlSection(
          songInfo: songInfo,
        ),
        CreateSliderSection(
          width: maxWidth * 0.5,
        ),
      ],
    );
  }
}

class CreateLikeandShuffleSection extends StatelessWidget {
  const CreateLikeandShuffleSection({
    super.key,
    required this.param,
    required this.songInfo,
  });

  final String? param;
  final DetailInfoSong? songInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      child: Row(
        children: [
          _LikeButtonWidget(
              preview: songInfo!.preview,
              id: param ?? '',
              artistNames: songInfo?.artistNames ?? '',
              title: songInfo?.title ?? '',
              image: songInfo?.imageUrl ?? ''),
          IconButtonWidget(
              iconData: Icons.ios_share,
              size: 20,
              color: AppColors.accent.color,
              onPressed: () {}),
        ],
      ),
    );
  }
}

class _LikeButtonWidget extends StatefulWidget {
  final String id;
  final String artistNames;
  final String title;
  final String image;
  final String preview;

  const _LikeButtonWidget(
      {Key? key,
      required this.id,
      required this.artistNames,
      required this.title,
      required this.image,
      required this.preview})
      : super(key: key);

  @override
  State<_LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<_LikeButtonWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteSongBloc, FavouriteSongState>(
        builder: (context, state) {
      if (state is LoadedFavouriteSongState) {
        isFavorite = state.data.any((song) => song.id == widget.id);
      } else {
        isFavorite = false;
      }
      return LikeButton(
          onPressed: () {
            final bloc = context.read<FavoriteSongBloc>();
            final songInfoModel = SongModel(
                preview: widget.preview,
                type: "track",
                id: widget.id,
                artistNames: widget.artistNames,
                title: widget.title,
                image: widget.image,
                isFavourite: isFavorite);

            bloc.add(ToggleIsFavourite(detailSong: songInfoModel));
          },
          isFavorite: isFavorite);
    });
  }
}

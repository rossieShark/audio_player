import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/ui/widgets/screens/index.dart';
import 'package:audio_player/ui/widgets/widgets/custom_buttons/custom_like_button.dart';

import 'package:flutter/material.dart';

class LikeButtonWidget extends StatefulWidget {
  final String id;
  final String artistNames;
  final String title;
  final String image;
  final String preview;

  const LikeButtonWidget(
      {Key? key,
      required this.id,
      required this.artistNames,
      required this.title,
      required this.image,
      required this.preview})
      : super(key: key);

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteSongBloc, FavouriteSongState>(
        builder: (context, state) {
      if (state is LoadedFavouriteSongState) {
        isFavorite = state.data.any((song) => song.id == widget.id);
      }
      return LikeButton(
          onPressed: () {
            final bloc = context.read<FavoriteSongBloc>();
            final songInfoModel = SongModel(
                preview: widget.preview,
                type: SearchFilters.track,
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

import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/domain/entity/played_song_model.dart';
import 'package:audio_player/app/ui/widgets/screens/album_detail_screen/content_widgets/no_data_widget.dart';

import 'package:audio_player/app/ui/widgets/screens/search_screen/bloc_loaded_state/search_section.dart';
import 'package:audio_player/app/ui/widgets/widgets/custom_buttons/like_buton_widget.dart';
import 'package:audio_player/app/ui/widgets/widgets/custom_buttons/play_pause_button.dart';
import 'package:audio_player/app/ui/widgets/widgets/fading_indicator.dart';

import 'package:audio_player/app/ui/widgets/widgets/songs_title_widget.dart';
import 'package:audio_player/app/ui/widgets/widgets/ui_properties.dart';
import 'package:audio_player/resources/resources.dart';

import 'package:flutter/material.dart';

class MiniPlayerSmallWidget extends StatefulWidget {
  const MiniPlayerSmallWidget({super.key});

  @override
  State<MiniPlayerSmallWidget> createState() => _MiniPlayerSmallWidgetState();
}

class _MiniPlayerSmallWidgetState extends State<MiniPlayerSmallWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState?>(builder: (context, state) {
      if (state?.currentSongId == null || state?.currentSongId == -1) {
        return SizedBox(
            width: MediaQuery.of(context).size.width, child: Container());
      } else {
        BlocProvider.of<DetailMusicPageBloc>(context).add(
          FetchSongDetailEvent(state!.currentSongId.toString()),
        );
        return WebDetailMusicPageContent(id: state.currentSongId.toString());
      }
    });
  }
}

class WebDetailMusicPageContent extends StatelessWidget {
  final String id;
  const WebDetailMusicPageContent({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMusicPageBloc, DetailMusicPageState>(
        builder: (context, state) {
      return state.map(
        error: (_) => const NoDataWidget(),
        loading: (_) => const Center(
          child: CustomFadingCircleIndicator(),
        ),
        loaded: (data) =>
            CreateMainWebContent(param: id, songInfo: data.songDetail),
      );
    });
  }
}

class CreateMainWebContent extends StatelessWidget {
  final DetailInfoSong? songInfo;
  final String? param;
  const CreateMainWebContent({super.key, this.songInfo, required this.param});

  @override
  Widget build(BuildContext context) {
    return CreateNarrowContent(songInfo: songInfo, param: param);
  }
}

class CreateNarrowContent extends StatelessWidget {
  const CreateNarrowContent({
    super.key,
    required this.songInfo,
    required this.param,
  });

  final DetailInfoSong? songInfo;
  final String? param;

  @override
  Widget build(BuildContext context) {
    final song = PlayedSong(id: songInfo!.id, preview: songInfo!.preview);
    return Container(
      color: AppColors.background.color,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _CreateImageSection(songInfo: songInfo!),
        Expanded(
          child: CreateSongTitle(
            artistName: songInfo?.artistNames,
            songTitle: songInfo?.title,
          ),
        ),
        CreatePlayPauseButton(
          playedSong: song,
          type: SearchFilters.track,
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: LikeButtonWidget(
              preview: songInfo!.preview,
              id: param ?? '',
              artistNames: songInfo?.artistNames ?? '',
              title: songInfo?.title ?? '',
              image: songInfo?.imageUrl ?? ''),
        ),
      ]),
    );
  }
}

class _CreateImageSection extends StatelessWidget {
  const _CreateImageSection({
    required this.songInfo,
  });

  final DetailInfoSong? songInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: SizedBox(
            height: 50,
            width: 50,
            child: songInfo?.imageUrl != null
                ? Image.network(
                    songInfo!.imageUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  )
                : Image.asset(
                    AppImages.black,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  )),
      ),
    );
  }
}

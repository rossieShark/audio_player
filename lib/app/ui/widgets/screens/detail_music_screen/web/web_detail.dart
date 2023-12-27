import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/app/ui/widgets/screens/album_detail_screen/content_widgets/no_data_widget.dart';
import 'package:audio_player/app/ui/widgets/screens/detail_music_screen/detail_music_index.dart';

import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class WebDetailMusicPage extends StatefulWidget {
  const WebDetailMusicPage({super.key});

  @override
  State<WebDetailMusicPage> createState() => _WebDetailMusicPageState();
}

class _WebDetailMusicPageState extends State<WebDetailMusicPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState?>(builder: (context, state) {
      if (state?.currentSongId == null || state?.currentSongId == -1) {
        return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const InactiveWebDetailPage());
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
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: ResponsiveWidget(
        narrow: (context) =>
            CreateNarrowContent(songInfo: songInfo, param: param),
        medium: (context) =>
            CreateMediumContent(songInfo: songInfo, param: param),
        mediumExtra: (context) =>
            CreateMediumExtraContent(songInfo: songInfo, param: param),
        large: (context) =>
            CreateLargeContent(songInfo: songInfo, param: param),
      ),
    );
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
    return SizedBox(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(
          width: 20,
        ),
        MusicControlSection(songInfo: songInfo!),
        CreateLikeandShuffleSection(param: param, songInfo: songInfo),
        const SizedBox(width: 16)
      ]),
    );
  }
}

class CreateMediumContent extends StatelessWidget {
  const CreateMediumContent({
    super.key,
    required this.songInfo,
    required this.param,
  });

  final DetailInfoSong? songInfo;
  final String? param;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _CreateImageSection(songInfo: songInfo),
      const SizedBox(width: 15),
      MusicControlSection(songInfo: songInfo!),
      CreateLikeandShuffleSection(param: param, songInfo: songInfo),
      const SizedBox(width: 16)
    ]);
  }
}

class CreateMediumExtraContent extends StatelessWidget {
  const CreateMediumExtraContent({
    super.key,
    required this.songInfo,
    required this.param,
  });

  final DetailInfoSong? songInfo;

  final String? param;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _CreateImageSection(songInfo: songInfo),
          CreateSongTitle(
            artistName: songInfo?.artistNames,
            songTitle: songInfo?.title,
          ),
        ],
      ),
      const SizedBox(width: 15),
      MusicControlSection(songInfo: songInfo!),
      CreateLikeandShuffleSection(param: param, songInfo: songInfo),
      const SizedBox(width: 16)
    ]);
  }
}

class CreateLargeContent extends StatelessWidget {
  const CreateLargeContent({
    super.key,
    required this.songInfo,
    required this.param,
  });

  final DetailInfoSong? songInfo;

  final String? param;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _CreateImageSection(songInfo: songInfo),
          CreateSongTitle(
            artistName: songInfo?.artistNames,
            songTitle: songInfo?.title,
          ),
        ],
      ),
      const SizedBox(width: 15),
      MusicControlSection(
        songInfo: songInfo!,
      ),
      CreateLikeandShuffleSection(param: param, songInfo: songInfo),
      const CreateVolumeSlider(),
    ]);
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
            height: 60,
            width: 60,
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

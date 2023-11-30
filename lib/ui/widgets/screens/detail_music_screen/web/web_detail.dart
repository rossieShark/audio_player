import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/databases/database.dart';
import 'package:audio_player/ui/widgets/screens/detail_music_screen/detail_music_index.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class WebDetailMusicPage extends StatelessWidget {
  const WebDetailMusicPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final id = context.watch<RecentlyPlayedIdCubit>().state;

    if (id == null) {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const InactiveWebDetailPage());
    } else {
      BlocProvider.of<DetailMusicPageBloc>(context)
          .add(FetchSongDetailEvent(id));
      return _WebDetailMusicPageContent(id: id);
    }
  }
}

class _WebDetailMusicPageContent extends StatefulWidget {
  final String id;
  const _WebDetailMusicPageContent({required this.id});

  @override
  State<_WebDetailMusicPageContent> createState() =>
      _WebDetailMusicPageContentState();
}

class _WebDetailMusicPageContentState
    extends State<_WebDetailMusicPageContent> {
  @override
  void didUpdateWidget(covariant _WebDetailMusicPageContent oldWidget) {
    if (widget.id != oldWidget.id) {
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use BlocProvider.of to get the existing bloc
    return BlocBuilder<DetailMusicPageBloc, DetailMusicPageState>(
      builder: (context, state) {
        if (state.songDetail == null) {
          return const Center(
            child: CustomFadingCircleIndicator(),
          );
        } else {
          final songInfo = state.songDetail;

          return Scaffold(
            backgroundColor: AppColors.background.color,
            body: CreateMainWebContent(param: widget.id, songInfo: songInfo),
          );
        }
      },
    );
  }
}

class CreateMainWebContent extends StatelessWidget {
  final DetailInfoSong? songInfo;
  final String? param;
  const CreateMainWebContent({super.key, this.songInfo, required this.param});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      narrow: (context) =>
          CreateNarrowContent(songInfo: songInfo, param: param),
      medium: (context) =>
          _CreateMediumContent(songInfo: songInfo, param: param),
      mediumExtra: (context) =>
          _CreateMediumExtraContent(songInfo: songInfo, param: param),
      large: (context) => _CreateLargeContent(songInfo: songInfo, param: param),
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
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const SizedBox(
        width: 20,
      ),
      MusicControlSection(songInfo: songInfo!),
      CreateLikeandShuffleSection(param: param, songInfo: songInfo),
      const SizedBox(width: 16)
    ]);
  }
}

class _CreateMediumContent extends StatelessWidget {
  const _CreateMediumContent({
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

class _CreateMediumExtraContent extends StatelessWidget {
  const _CreateMediumExtraContent({
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

class _CreateLargeContent extends StatelessWidget {
  const _CreateLargeContent({
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
          child: Image.network(
            songInfo?.imageUrl ?? imagesMap[Images.defaultImage]!,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}

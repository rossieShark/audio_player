import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/widgets/screens/album_detail_screen/detail_album_index.dart';
import 'package:audio_player/ui/widgets/screens/detail_music_screen/detail_music_index.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileDetailMusicPage extends StatefulWidget {
  final String param;
  const MobileDetailMusicPage({super.key, required this.param});

  @override
  State<MobileDetailMusicPage> createState() => _MobileDetailMusicPageState();
}

class _MobileDetailMusicPageState extends State<MobileDetailMusicPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailMusicPageBloc>(context).add(
      FetchSongDetailEvent(widget.param),
    );
  }

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
              DetailMusicBody(widget: widget, songInfo: data.songDetail));
    });
  }
}

class DetailMusicBody extends StatelessWidget {
  const DetailMusicBody({
    super.key,
    required this.widget,
    required this.songInfo,
  });

  final MobileDetailMusicPage widget;
  final DetailInfoSong? songInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: SingleChildScrollView(
        child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy > 10) {
                GoRouter.of(context).pop();
              }
            },
            child: _CreatMainContent(
              param: widget.param,
              songInfo: songInfo,
            )),
      ),
    );
  }
}

class _CreatMainContent extends StatelessWidget {
  final DetailInfoSong? songInfo;
  final String param;

  const _CreatMainContent({required this.songInfo, required this.param});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        _BackgroundImage(
            maxWidth: maxWidth, maxHeight: maxHeight, songInfo: songInfo),
        SizedBox(
          height: maxHeight / 2 - 20 < 0 ? maxHeight / 2 : maxHeight / 2 - 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CreateTitleSection(
                param: param,
                songInfo: songInfo,
              ),
              CreateSliderSection(
                width: maxWidth * 0.7,
              ),
              CreatMusicControlSection(
                songInfo: songInfo!,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    required this.maxWidth,
    required this.maxHeight,
    required this.songInfo,
  });

  final double maxWidth;
  final double maxHeight;
  final DetailInfoSong? songInfo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(maxWidth / 2),
        bottomRight: Radius.circular(maxWidth / 2),
      ),
      child: SizedBox(
          height: maxHeight / 2,
          width: maxWidth - maxWidth * 0.2,
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
    );
  }
}

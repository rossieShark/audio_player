import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/app/ui/widgets/screens/album_detail_screen/detail_album_index.dart';
import 'package:audio_player/app/ui/widgets/screens/detail_music_screen/detail_music_index.dart';
import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class MiniPlayerLargeWidget extends StatelessWidget {
  final String param;
  final double height;
  const MiniPlayerLargeWidget(
      {super.key, required this.param, required this.height});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMusicPageBloc, DetailMusicPageState>(
        builder: (context, state) {
      return state.map(
          error: (_) => const NoDataWidget(),
          loading: (_) => const Center(
                child: CustomFadingCircleIndicator(),
              ),
          loaded: (data) => MiniPlayerLargeWidgetLoaded(
                param: param,
                songInfo: data.songDetail,
                height: height,
              ));
    });
  }
}

class MiniPlayerLargeWidgetLoaded extends StatelessWidget {
  const MiniPlayerLargeWidgetLoaded(
      {super.key,
      required this.param,
      required this.songInfo,
      required this.height});

  final String param;
  final DetailInfoSong? songInfo;
  final double height;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    if (height > maxHeight / 2) {
      return _FullScreenContent(
          maxWidth: maxWidth, height: height, songInfo: songInfo, param: param);
    } else {
      return _HalfScreenContent(param: param, songInfo: songInfo);
    }
  }
}

class _HalfScreenContent extends StatelessWidget {
  const _HalfScreenContent({
    required this.param,
    required this.songInfo,
  });

  final String param;
  final DetailInfoSong? songInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CreateTitleSection(
            param: param,
            songInfo: songInfo,
          ),
          CreatMusicControlSection(
            songInfo: songInfo!,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class _FullScreenContent extends StatelessWidget {
  const _FullScreenContent({
    required this.maxWidth,
    required this.height,
    required this.songInfo,
    required this.param,
  });

  final double maxWidth;
  final double height;
  final DetailInfoSong? songInfo;
  final String param;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: Column(
        children: [
          _BackgroundImage(
              maxWidth: maxWidth, maxHeight: height, songInfo: songInfo),
          Expanded(
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
      ),
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

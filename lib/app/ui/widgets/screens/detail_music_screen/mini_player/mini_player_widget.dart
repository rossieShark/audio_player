import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/ui/widgets/screens/detail_music_screen/mini_player/mini_player_small_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:miniplayer/miniplayer.dart';

import 'mini_player_large_widget.dart';

class MiniPlayerWidget extends StatelessWidget {
  const MiniPlayerWidget({super.key});
  static const double _playerMinHeight = 60.0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - 200;
    return BlocBuilder<MusicBloc, MusicState?>(builder: (context, state) {
      return Offstage(
        offstage: state?.currentSongId == null || state?.currentSongId == -1,
        child: Miniplayer(
            minHeight: _playerMinHeight,
            maxHeight: height,
            builder: (height, percentage) {
              if (height == _playerMinHeight) {
                return const MiniPlayerSmallWidget();
              } else {
                return MiniPlayerLargeWidget(
                  param: state!.currentSongId.toString(),
                  height: height,
                );
              }
            }),
      );
    });
  }
}

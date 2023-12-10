import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

class NewPlaylistContent extends StatelessWidget {
  const NewPlaylistContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background.color,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add new songs',
                style: TextStyle(
                    color: AppColors.white.color,
                    fontFamily: FontFamily.poiretOne,
                    fontSize: 25,
                    fontWeight: FontWeight.w200),
              ),
              const SizedBox(
                height: 20,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: AppColors.white.color,
                    size: 40,
                  ))
            ],
          ),
        ));
  }
}

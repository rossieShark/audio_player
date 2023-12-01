import 'package:audio_player/resources/resources.dart';
import 'package:flutter/material.dart';

class CreateAppImage extends StatelessWidget {
  const CreateAppImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: Image.asset(
        AppImages.soundLogo,
      ),
    );
  }
}

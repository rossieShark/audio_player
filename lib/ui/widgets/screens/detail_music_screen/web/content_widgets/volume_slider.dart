import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateVolumeSlider extends StatelessWidget {
  const CreateVolumeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButtonWidget(
          onPressed: () {},
          iconData: Icons.volume_up,
          size: 20,
          color: AppColors.accent.color,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.13,
          child: Slider(
            inactiveColor: AppColors.black.color,
            activeColor: const Color.fromARGB(255, 85, 85, 85),
            thumbColor: AppColors.accent.color,
            min: 0.0,
            max: 1.0,
            onChanged: (double value) async {},
            value: 0.5,
          ),
        ),
      ],
    );
  }
}

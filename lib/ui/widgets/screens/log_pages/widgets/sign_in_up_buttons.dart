import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateRegisterWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String buttonNext;
  const CreateRegisterWidget(
      {super.key,
      required this.text,
      required this.onTap,
      required this.buttonNext});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: AppColors.white.color),
        ),
        GestureDetector(
            onTap: onTap,
            child: Text(
              buttonNext,
              style: TextStyle(color: AppColors.accent.color),
            )),
      ],
    );
  }
}

import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';

import 'package:flutter/cupertino.dart';

class SignMethods extends StatelessWidget {
  final VoidCallback onGoogleTap;

  const SignMethods({super.key, required this.onGoogleTap});
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onGoogleTap,
            child: SizedBox(
                width: 18,
                height: 18,
                child: Image.asset(
                  AppImages.google,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            width: 7,
          ),
          SizedBox(
              width: 20,
              height: 20,
              child: Image.asset(
                AppImages.facebook,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(
              AppImages.facebook,
              color: AppColors.white.color,
              fit: BoxFit.cover,
            ),
          ),
        ]);
  }
}

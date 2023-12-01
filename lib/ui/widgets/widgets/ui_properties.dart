import 'package:flutter/material.dart';

enum AppColors { background, accent, white, black, darkAccent }

extension AppColorsExtension on AppColors {
  Color get color {
    switch (this) {
      case AppColors.background:
        return const Color.fromARGB(255, 25, 24, 24);
      case AppColors.accent:
        return const Color.fromARGB(255, 176, 70, 119);
      case AppColors.darkAccent:
        return const Color.fromARGB(255, 122, 15, 56);
      case AppColors.black:
        return Colors.black;
      default:
        return const Color.fromARGB(255, 239, 237, 237);
    }
  }
}

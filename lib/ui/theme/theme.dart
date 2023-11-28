import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  BottomNavigationBarThemeData createBottomNavigationBarTheme() {
    return BottomNavigationBarThemeData(
      backgroundColor: AppColors.background.color,
      selectedIconTheme: IconThemeData(color: AppColors.accent.color),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(color: AppColors.accent.color),
      unselectedIconTheme: IconThemeData(color: AppColors.white.color),
      unselectedLabelStyle: TextStyle(color: AppColors.white.color),
      selectedItemColor: Colors.transparent,
      unselectedItemColor: Colors.transparent,
    );
  }

  NavigationRailThemeData createNavBarTheme() {
    return NavigationRailThemeData(
      backgroundColor: AppColors.background.color,
      selectedLabelTextStyle:
          TextStyle(color: AppColors.accent.color, fontSize: 15),
      labelType: NavigationRailLabelType.all,
      unselectedLabelTextStyle:
          const TextStyle(color: Colors.transparent, fontSize: 0),
      selectedIconTheme: IconThemeData(color: AppColors.accent.color),
      unselectedIconTheme: IconThemeData(
        color: AppColors.white.color,
      ),
      indicatorColor: Colors.transparent,
      useIndicator: false,
    );
  }
}

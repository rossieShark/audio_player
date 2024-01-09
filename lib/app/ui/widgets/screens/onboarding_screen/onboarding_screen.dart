import 'package:audio_player/app/ui/widgets/screens/onboarding_screen/components/onboarding_page.dart';
import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: PageView(
        controller: controller,
        children: [
          OnboardingPage(
            image: AppImages.onboarding1,
            title: 'Music',
            description:
                'All the songs of the world in your app. Listen everywhere and always.',
            upperColor: AppColors.white.color,
            bottomColor: AppColors.accent.color,
            titleColor: AppColors.white.color,
            buttonColor: AppColors.white.color,
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 0,
          ),
          OnboardingPage(
            image: AppImages.onboarding2,
            title: 'Music',
            description:
                'All the songs of the world in your app. Listen everywhere and always.',
            upperColor: AppColors.accent.color,
            bottomColor: AppColors.white.color,
            titleColor: AppColors.accent.color,
            buttonColor: AppColors.accent.color,
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 1,
          ),
          OnboardingPage(
            image: AppImages.onboarding3,
            title: 'Music',
            description:
                'All the songs of the world in your app. Listen everywhere and always.',
            upperColor: AppColors.white.color,
            bottomColor: AppColors.accent.color,
            titleColor: AppColors.white.color,
            buttonColor: AppColors.white.color,
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 2,
          )
        ],
      ),
    );
  }

  void changeScreen(int nextScreenNo) {
    controller.animateToPage(nextScreenNo,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}

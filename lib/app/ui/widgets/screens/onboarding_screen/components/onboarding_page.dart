import 'package:audio_player/app/ui/navigation/navigation_routes.dart';
import 'package:audio_player/app/ui/widgets/screens/onboarding_screen/components/curve_painter.dart';
import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Color upperColor;
  final Color bottomColor;
  final int noOfScreen;
  final Color buttonColor;
  final Color titleColor;

  final Function(int) onNextPressed;

  final int currentScreenNo;
  const OnboardingPage(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.upperColor,
      required this.bottomColor,
      required this.noOfScreen,
      required this.onNextPressed,
      required this.currentScreenNo,
      required this.buttonColor,
      required this.titleColor});

  @override
  Widget build(BuildContext context) {
    bool isLastScreen = currentScreenNo >= noOfScreen - 1;
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height, color: bottomColor),
        CustomPaint(
          painter: CurvePainter(pathColor: upperColor),
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
          ),
        ),
        Positioned.fill(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 70,
              ),
              Center(
                child: Image(
                    image: AssetImage(
                      image,
                    ),
                    height: MediaQuery.of(context).size.height / 3.2),
              ),
              const SizedBox(
                height: 150,
              ),
              _CreateOnboardingTitle(
                title: title,
                textColor: titleColor,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                description,
                style: TextStyle(
                  fontFamily: FontFamily.cormorantInfant,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.background.color,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: Visibility(
              visible: !isLastScreen,
              replacement: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 250,
                      height: 40,
                      child: OnboardingPageButtons(
                          buttonColor: buttonColor,
                          buttonText: "Get Started",
                          onPressed: () {
                            openHomeScreen(context);
                          }))
                ],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnboardingPageButtons(
                      onPressed: () {
                        openHomeScreen(context);
                      },
                      buttonText: 'Skip',
                      buttonColor: buttonColor,
                    ),
                    Row(
                      children: [
                        for (int index = 0; index < noOfScreen; index++)
                          createProgressDots(
                              (index == currentScreenNo) ? true : false)
                      ],
                    ),
                    OnboardingPageButtons(
                      onPressed: () {
                        onNextPressed(currentScreenNo + 1);
                      },
                      buttonText: 'Next',
                      buttonColor: buttonColor,
                    )
                  ]),
            ))
      ],
    );
  }

  Widget createProgressDots(bool isActiveScreen) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActiveScreen ? 10 : 10,
      width: isActiveScreen ? 10 : 10,
      decoration: BoxDecoration(
          color: isActiveScreen
              ? AppColors.darkAccent.color
              : const Color.fromARGB(255, 205, 198, 198),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }

  void openHomeScreen(BuildContext context) {
    context.go(Routes().home);
  }
}

class OnboardingPageButtons extends StatelessWidget {
  final VoidCallback onPressed;
  final Color buttonColor;
  final String buttonText;
  const OnboardingPageButtons(
      {super.key,
      required this.onPressed,
      required this.buttonColor,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: buttonColor),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
                color: AppColors.background.color,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          )),
    );
  }
}

class _CreateOnboardingTitle extends StatelessWidget {
  final String title;
  final Color textColor;
  const _CreateOnboardingTitle({required this.title, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.poiretOne,
          color: textColor,
        ));
  }
}

import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';
import 'package:audio_player/ui/widgets/widgets/app_logo.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CreateAppInformationWidget(),
          _SignMethodsWidget(),
        ],
      )),
    );
  }
}

class _SignMethodsWidget extends StatelessWidget {
  const _SignMethodsWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              width: 140,
              onPressed: () {
                context.go(routeNameMap[RouteName.sigIn]!);
              },
              buttonText: AppLocalizations.of(context)!.signInButton),
          const SizedBox(
            width: 30,
          ),
          CustomButton(
              width: 140,
              onPressed: () {
                context.go(routeNameMap[RouteName.signUp]!);
              },
              buttonText: AppLocalizations.of(context)!.signUpButton),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}

class _CreateAppInformationWidget extends StatelessWidget {
  const _CreateAppInformationWidget();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CreateAppImage(),
        _CreateAppTitle(),
        _CreateAppDescription(),
      ],
    );
  }
}

class _CreateAppDescription extends StatelessWidget {
  const _CreateAppDescription();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _CreateAppTitle extends StatelessWidget {
  const _CreateAppTitle();

  @override
  Widget build(BuildContext context) {
    return const Text('Louder',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.poiretOne,
          color: Colors.white,
        ));
  }
}

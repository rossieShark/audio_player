// ignore_for_file: use_build_context_synchronously

import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';

import 'package:audio_player/app/ui/navigation/navigation_routes.dart';

import 'package:audio_player/app/domain/services/services.dart';
import 'package:audio_player/app/ui/widgets/screens/log_pages/sign_in/sign_in_text_fields.dart';
import 'package:audio_player/app/ui/widgets/screens/log_pages/widgets/other_sign_methods.dart';
import 'package:audio_player/app/ui/widgets/screens/log_pages/widgets/sign_in_up_buttons.dart';
import 'package:audio_player/app/ui/widgets/widgets/app_logo.dart';

import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _loginTextController;
  late TextEditingController _passwordTextController;

  late FocusNode _passwordFocusNode;
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    _loginTextController = TextEditingController();
    _loginTextController.addListener(() {
      setState(() {});
    });
    _passwordTextController = TextEditingController();
    _passwordTextController.addListener(() {
      setState(() {});
    });

    _passwordFocusNode = FocusNode();
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
    _emailFocusNode = FocusNode();
    _emailFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _loginTextController.dispose();
    _passwordTextController.dispose();
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: SafeArea(
        child: ListView(children: [
          const CreateAppImage(),
          SignInWidget(
            emailFocusNode: _emailFocusNode,
            loginTextController: _loginTextController,
            passwordFocusNode: _passwordFocusNode,
            passwordTextController: _passwordTextController,
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: CustomButton(
                onPressed: () => FireBaseFunctions().signIn(
                      context,
                      _loginTextController.text,
                      _passwordTextController.text,
                    ),
                buttonText: AppLocalizations.of(context)!.signInButton),
          ),
          const SizedBox(
            height: 10,
          ),
          CreateOtherSignMethods(
            signMethodsText: AppLocalizations.of(context)!.signInMethods,
          ),
          const SizedBox(
            height: 20,
          ),
          CreateRegisterWidget(
            text: AppLocalizations.of(context)!.noAccount,
            onTap: () => context.go(Routes().signUp),
            buttonNext: AppLocalizations.of(context)!.signUpButton,
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}

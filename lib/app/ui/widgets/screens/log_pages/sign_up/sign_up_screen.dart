// ignore_for_file: use_build_context_synchronously

import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';

import 'package:audio_player/app/ui/navigation/navigation_routes.dart';
import 'package:audio_player/app/domain/services/services.dart';
import 'package:audio_player/app/ui/widgets/screens/log_pages/sign_up/sign_up_text_fields.dart';
import 'package:audio_player/app/ui/widgets/screens/log_pages/widgets/other_sign_methods.dart';
import 'package:audio_player/app/ui/widgets/screens/log_pages/widgets/sign_in_up_buttons.dart';
import 'package:audio_player/app/ui/widgets/widgets/app_logo.dart';

import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {
  late TextEditingController _signUpTextController;
  late TextEditingController _passwordTextController;
  late FocusNode _passwordFocusNode;
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeFocusNode();
  }

  void _initializeControllers() {
    _signUpTextController = TextEditingController();
    _signUpTextController.addListener(() {
      setState(() {});
    });
    _passwordTextController = TextEditingController();
    _passwordTextController.addListener(() {
      setState(() {});
    });
  }

  void _initializeFocusNode() {
    _passwordFocusNode = FocusNode();
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
    _emailFocusNode = FocusNode();
    _emailFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _signUpTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: SafeArea(
        child: ListView(children: [
          const CreateAppImage(),
          SignUpWidget(
            emailFocusNode: _emailFocusNode,
            signUpTextController: _signUpTextController,
            passwordFocusNode: _passwordFocusNode,
            passwordTextController: _passwordTextController,
          ),
          const SizedBox(
            height: 65,
          ),
          Center(
            child: CustomButton(
              onPressed: () => FireBaseFunctions().signUp(
                context,
                _signUpTextController.text,
                _passwordTextController.text,
              ),
              buttonText: AppLocalizations.of(context)!.signUpButton,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CreateOtherSignMethods(
            signMethodsText: AppLocalizations.of(context)!.signUpMethods,
          ),
          const SizedBox(
            height: 20,
          ),
          CreateRegisterWidget(
            text: AppLocalizations.of(context)!.alreadyHaveAnAccount,
            onTap: () => context.go(Routes().signIn),
            buttonNext: AppLocalizations.of(context)!.signInButton,
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}

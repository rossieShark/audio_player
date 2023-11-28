// ignore_for_file: use_build_context_synchronously

import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';

import 'package:audio_player/services/services.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
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
  late TextEditingController _resetPasswordTextController;
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
    _resetPasswordTextController = TextEditingController();
    _resetPasswordTextController.addListener(() {
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

  Future<void> _signIn() async {
    bool success = await FireBaseFunctions()
        .signIn(_loginTextController.text, _passwordTextController.text);
    if (success) {
      return context.go(routeNameMap[RouteName.home]!);
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            SignAlert(text: AppLocalizations.of(context)!.invalidEmailPassword),
      );
    }
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Image.asset(
                    imagesMap[Images.appIcon]!,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: CustomTextField(
                          obscureText: false,
                          focusNode: _emailFocusNode,
                          controller: _loginTextController,
                          hintText: AppLocalizations.of(context)!.enterEmail,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: CustomTextField(
                          obscureText: true,
                          focusNode: _passwordFocusNode,
                          controller: _passwordTextController,
                          hintText: AppLocalizations.of(context)!.enterPassword,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      _CreateForgetPasswordWidget(
                          resetPasswordTextController:
                              _resetPasswordTextController)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    CustomButton(
                        onPressed: () {
                          _signIn();
                        },
                        buttonText: AppLocalizations.of(context)!.signInButton),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(AppLocalizations.of(context)!.signInMethods,
                          style: TextStyle(
                              color: AppColors.white.color,
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ),
                    SignMethods(
                      onGoogleTap: () {
                        FireBaseFunctions().validSignWithGoogle(context);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const _CreateRegisterWidget()
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ]),
        ),
      ),
    );
  }
}

class _CreateForgetPasswordWidget extends StatelessWidget {
  const _CreateForgetPasswordWidget({
    required TextEditingController resetPasswordTextController,
  }) : _resetPasswordTextController = resetPasswordTextController;

  final TextEditingController _resetPasswordTextController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FireBaseFunctions()
            .resetPassword(context, _resetPasswordTextController);
      },
      child: SizedBox(
        width: 400,
        child: Align(
            alignment: Alignment.bottomRight,
            child: Text(AppLocalizations.of(context)!.forgotPassword,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400))),
      ),
    );
  }
}

class _CreateRegisterWidget extends StatelessWidget {
  const _CreateRegisterWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.noAccount,
          style: TextStyle(color: AppColors.white.color),
        ),
        GestureDetector(
            onTap: () {
              context.go(routeNameMap[RouteName.signUp]!);
            },
            child: Text(
              AppLocalizations.of(context)!.signUpButton,
              style: TextStyle(color: AppColors.accent.color),
            )),
      ],
    );
  }
}

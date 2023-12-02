// ignore_for_file: use_build_context_synchronously

import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';

import 'package:audio_player/ui/navigation/navigation_routes.dart';

import 'package:audio_player/domain/services/services.dart';
import 'package:audio_player/ui/widgets/screens/log_pages/sign_in/sign_in_text_fields.dart';
import 'package:audio_player/ui/widgets/screens/log_pages/widgets/other_sign_methods.dart';
import 'package:audio_player/ui/widgets/screens/log_pages/widgets/sign_in_up_buttons.dart';
import 'package:audio_player/ui/widgets/widgets/app_logo.dart';

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
            onTap: () => context.go(routeNameMap[RouteName.signUp]!),
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

// class _CreateOtherSignMethods extends StatelessWidget {
//   const _CreateOtherSignMethods({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: Text(AppLocalizations.of(context)!.signInMethods,
//               style: TextStyle(
//                   color: AppColors.white.color,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400)),
//         ),
                  
//     SignMethods(
//       onGoogleTap: () =>
//         FireBaseFunctions().validSignWithGoogle(context),
    
//     ),
//         ],
//     );
//   }
// }

// class _CreateLoginSection extends StatelessWidget {
//   const _CreateLoginSection({
//     super.key,
//     required FocusNode emailFocusNode,
//     required TextEditingController loginTextController,
//     required FocusNode passwordFocusNode,
//     required TextEditingController passwordTextController,
//     required TextEditingController resetPasswordTextController,
//   }) : _emailFocusNode = emailFocusNode, _loginTextController = loginTextController, _passwordFocusNode = passwordFocusNode, _passwordTextController = passwordTextController, _resetPasswordTextController = resetPasswordTextController;

//   final FocusNode _emailFocusNode;
//   final TextEditingController _loginTextController;
//   final FocusNode _passwordFocusNode;
//   final TextEditingController _passwordTextController;
//   final TextEditingController _resetPasswordTextController;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
//             child: CustomTextField(
//               obscureText: false,
//               focusNode: _emailFocusNode,
//               controller: _loginTextController,
//               hintText: AppLocalizations.of(context)!.enterEmail,
//             ),
//           ),
//           CreatePasswordTextField(
//             focusNode: _passwordFocusNode,
//             passwordController: _passwordTextController,
//             hintText: AppLocalizations.of(context)!.enterPassword,
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           _CreateForgetPasswordWidget(
//               resetPasswordTextController:
//                   _resetPasswordTextController)
//         ],
//       ),
//     );
//   }
// }

// class _CreateForgetPasswordWidget extends StatelessWidget {
//   const _CreateForgetPasswordWidget({
//     required TextEditingController resetPasswordTextController,
//   }) : _resetPasswordTextController = resetPasswordTextController;

//   final TextEditingController _resetPasswordTextController;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FireBaseFunctions()
//             .resetPassword(context, _resetPasswordTextController);
//       },
//       child: SizedBox(
//         width: 400,
//         child: Align(
//             alignment: Alignment.bottomRight,
//             child: Text(AppLocalizations.of(context)!.forgotPassword,
//                 style: const TextStyle(
//                     color: Colors.grey,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400))),
//       ),
//     );
//   }
// }

// class _CreateRegisterWidget extends StatelessWidget {
//   const _CreateRegisterWidget();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           AppLocalizations.of(context)!.noAccount,
//           style: TextStyle(color: AppColors.white.color),
//         ),
//         GestureDetector(
//             onTap: () {
//               context.go(routeNameMap[RouteName.signUp]!);
//             },
//             child: Text(
//               AppLocalizations.of(context)!.signUpButton,
//               style: TextStyle(color: AppColors.accent.color),
//             )),
//       ],
//     );
//   }
// }

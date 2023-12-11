import 'package:audio_player/domain/services/services.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    super.key,
    required FocusNode emailFocusNode,
    required TextEditingController loginTextController,
    required FocusNode passwordFocusNode,
    required TextEditingController passwordTextController,
  })  : _emailFocusNode = emailFocusNode,
        _loginTextController = loginTextController,
        _passwordFocusNode = passwordFocusNode,
        _passwordTextController = passwordTextController;

  final FocusNode _emailFocusNode;
  final TextEditingController _loginTextController;
  final FocusNode _passwordFocusNode;
  final TextEditingController _passwordTextController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: CustomTextField(
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              focusNode: _emailFocusNode,
              controller: _loginTextController,
              hintText: AppLocalizations.of(context)!.enterEmail,
            ),
          ),
        ),
        CreatePasswordTextField(
          focusNode: _passwordFocusNode,
          passwordController: _passwordTextController,
          hintText: AppLocalizations.of(context)!.enterPassword,
        ),
        const SizedBox(
          height: 8,
        ),
        _CreateForgetPasswordWidget()
      ],
    );
  }
}

class _CreateForgetPasswordWidget extends StatelessWidget {
  _CreateForgetPasswordWidget();

  final TextEditingController _resetPasswordTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FireBaseFunctions()
            .resetPassword(context, _resetPasswordTextController);
      },
      child: Center(
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
      ),
    );
  }
}

import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';

class SignUpWidget extends StatelessWidget {
  final FocusNode emailFocusNode;
  final TextEditingController signUpTextController;
  final FocusNode passwordFocusNode;
  final TextEditingController passwordTextController;

  const SignUpWidget({
    super.key,
    required this.emailFocusNode,
    required this.signUpTextController,
    required this.passwordFocusNode,
    required this.passwordTextController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: CustomTextField(
                obscureText: false,
                focusNode: emailFocusNode,
                controller: signUpTextController,
                hintText: AppLocalizations.of(context)!.enterEmail,
              ),
            ),
            CreatePasswordTextField(
              focusNode: passwordFocusNode,
              passwordController: passwordTextController,
              hintText: AppLocalizations.of(context)!.enterPassword,
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}

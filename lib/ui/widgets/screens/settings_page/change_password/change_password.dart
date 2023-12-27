// ignore_for_file: use_build_context_synchronously

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/services/services.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController _passwordController;
  late TextEditingController _newPasswordController;
  late FocusNode _passwordFocusNode;
  late FocusNode _newPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() {
    _passwordFocusNode = FocusNode();
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
    _newPasswordFocusNode = FocusNode();
    _newPasswordFocusNode.addListener(() {
      setState(() {});
    });
    _passwordController = TextEditingController();
    _newPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _newPasswordController.dispose();
    _passwordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resultText = context.watch<PasswordMissmatchCubit>().state;
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 100),
          CreatePasswordTextField(
            passwordController: _passwordController,
            focusNode: _passwordFocusNode,
            hintText: AppLocalizations.of(context)!.enterPassword,
          ),
          const SizedBox(height: 20),
          CreatePasswordTextField(
            passwordController: _newPasswordController,
            focusNode: _newPasswordFocusNode,
            hintText: AppLocalizations.of(context)!.confirmPassword,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              resultText,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: CustomButton(
              width: 120,
              onPressed: () => _changePassword(context),
              buttonText: AppLocalizations.of(context)!.changebutton,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _changePassword(BuildContext context) async {
    await FireBaseFunctions().changePassword(
      _passwordController.text,
      _newPasswordController.text,
      context,
    );
  }
}

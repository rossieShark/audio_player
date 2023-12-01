import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreatePasswordTextField extends StatefulWidget {
  const CreatePasswordTextField({
    super.key,
    required this.passwordController,
    required this.focusNode,
    required this.hintText,
  });
  final TextEditingController passwordController;
  final FocusNode focusNode;
  final String hintText;

  @override
  State<CreatePasswordTextField> createState() =>
      _CreatePasswordTextFieldState();
}

class _CreatePasswordTextFieldState extends State<CreatePasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: CustomTextField(
                width: 400 - 40,
                obscureText: obscureText,
                focusNode: widget.focusNode,
                controller: widget.passwordController,
                hintText: widget.hintText,
              )),
          GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                  color: AppColors.white.color,
                  !obscureText ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          const SizedBox(
            width: 4,
          )
        ]);
  }
}

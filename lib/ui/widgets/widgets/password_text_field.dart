import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
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
    final narrowWidth = MediaQuery.of(context).size.width - 70 > 0
        ? MediaQuery.of(context).size.width - 70
        : 70;
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: ResponsiveBuilder(
                    narrow: narrowWidth,
                    medium: 400.0 - 40,
                    large: 400.0 - 40,
                    builder: (context, child, width) {
                      return CustomTextField(
                          width: width.toDouble(),
                          obscureText: obscureText,
                          focusNode: widget.focusNode,
                          controller: widget.passwordController,
                          hintText: widget.hintText,
                          onChanged: (text) {
                            context
                                .read<PasswordMissmatchCubit>()
                                .passwordMissmatchText('');
                          });
                    })),
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
          ]),
    );
  }
}

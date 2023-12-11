import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FocusNode focusNode;
  final bool obscureText;
  final double width;
  final void Function(String)? onChanged;
  final Icon? prefixIcon;
  final void Function()? onPressed;
  final Color? textFieldColor;
  final Color? textColor;
  final bool? showSuffixIcon;
  final Color? borderColor;
  final TextInputType? textInputType;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.obscureText,
      required this.hintText,
      required this.focusNode,
      this.width = 400,
      this.onChanged,
      this.prefixIcon,
      this.onPressed,
      this.textFieldColor,
      this.showSuffixIcon,
      this.borderColor,
      this.textInputType,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: width,
        height: 45,
        decoration:
            BoxDecoration(color: textFieldColor ?? AppColors.white.color),
        child: TextField(
          keyboardType: textInputType,
          obscureText: obscureText,
          controller: controller,
          focusNode: focusNode,
          cursorColor: AppColors.accent.color,
          onChanged: onChanged,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
              labelStyle: TextStyle(color: AppColors.white.color),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: controller.text.isNotEmpty
                      ? AppColors.white.color
                      : borderColor ?? Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: AppColors.white.color),
              ),
              suffixIcon: (showSuffixIcon ??
                      controller.text.isNotEmpty && focusNode.hasFocus)
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      color: AppColors.accent.color,
                      onPressed: () {
                        onPressed;
                        controller.clear();
                      },
                    )
                  : null),
          style: TextStyle(
              fontSize: 14,
              fontFamily: FontFamily.poiretOne,
              fontWeight: FontWeight.w600,
              color: textColor ?? AppColors.black.color),
        ),
      ),
    );
  }
}

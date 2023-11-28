import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final FocusNode focusNode;
  final bool obscureText;
  final double width;
  final void Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.focusNode,
    this.width = 400,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: widget.width,
        height: 45,
        decoration: BoxDecoration(color: AppColors.white.color),
        child: TextField(
          obscureText: widget.obscureText,
          controller: widget.controller,
          focusNode: widget.focusNode,
          cursorColor: AppColors.accent.color,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey),
            labelStyle: TextStyle(color: AppColors.white.color),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: widget.controller.text.isNotEmpty
                    ? AppColors.white.color
                    : Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: AppColors.white.color),
            ),
            suffixIcon:
                widget.controller.text.isNotEmpty && widget.focusNode.hasFocus
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        color: AppColors.accent.color,
                        onPressed: () {
                          setState(() {
                            widget.controller.clear();
                          });
                        },
                      )
                    : null,
          ),
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.black.color),
        ),
      ),
    );
  }
}

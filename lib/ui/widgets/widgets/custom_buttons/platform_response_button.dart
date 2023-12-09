import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;
  final Color? color;
  final double? size;

  const IconButtonWidget({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        size: size,
        color: color,
      ),
      onPressed: onPressed,
      padding: EdgeInsets.zero,
    );
  }
}

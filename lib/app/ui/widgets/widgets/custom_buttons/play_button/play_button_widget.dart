import 'dart:math';

import 'package:audio_player/app/ui/widgets/widgets/custom_buttons/play_button/blob_widget.dart';
import 'package:audio_player/app/ui/widgets/widgets/ui_properties.dart';
import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  final Color containerColor;

  final VoidCallback? onPressed;
  final double size;
  final Icon icon;

  const PlayButton(
      {super.key,
      required this.size,
      this.onPressed,
      required this.containerColor,
      required this.icon});

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> with TickerProviderStateMixin {
  static const _kToggleDuration = Duration(milliseconds: 300);
  static const _kRotationDuration = Duration(seconds: 5);

  // rotation and scale animations
  late AnimationController _rotationController;
  late AnimationController _scaleController;
  double _rotation = 0;
  double _scale = 0.85;

  bool get _showWaves => !_scaleController.isDismissed;

  void _updateRotation() => _rotation = _rotationController.value * 2 * pi;
  void _updateScale() => _scale = (_scaleController.value * 0.2) + 0.85;

  @override
  void initState() {
    _rotationController =
        AnimationController(vsync: this, duration: _kRotationDuration)
          ..addListener(() => setState(_updateRotation))
          ..repeat();

    _scaleController =
        AnimationController(vsync: this, duration: _kToggleDuration)
          ..addListener(() => setState(_updateScale));

    super.initState();
  }

  void _onToggle() {
    if (_scaleController.isCompleted) {
      _scaleController.reverse();
    } else {
      _scaleController.forward();
    }

    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  Widget _buildIcon() {
    return SizedBox.expand(
      child: IconButton(
        icon: widget.icon,
        onPressed: _onToggle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          // minWidth: 24,
          // minHeight: 25,
          maxHeight: widget.size,
          maxWidth: widget.size),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (_showWaves) ...[
            Blob(
                color: Color.fromARGB(255, 204, 165, 48),
                scale: _scale,
                rotation: _rotation),
            Blob(
                color: Color.fromARGB(255, 93, 32, 52),
                scale: _scale,
                rotation: _rotation * 2 - 30),
            Blob(
                color: AppColors.darkAccent.color,
                scale: _scale,
                rotation: _rotation * 3 - 45),
          ],
          Container(
            constraints: BoxConstraints.expand(),
            child: AnimatedSwitcher(
              child: _buildIcon(),
              duration: _kToggleDuration,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: widget.containerColor),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotationController.dispose();
    super.dispose();
  }
}

import 'package:audio_player/domain/services/services.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateOtherSignMethods extends StatelessWidget {
  final String signMethodsText;
  const CreateOtherSignMethods({
    required this.signMethodsText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(signMethodsText,
              style: TextStyle(
                  color: AppColors.white.color,
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
        ),
        SignMethods(
          onGoogleTap: () => FireBaseFunctions().validSignWithGoogle(context),
        ),
      ],
    );
  }
}

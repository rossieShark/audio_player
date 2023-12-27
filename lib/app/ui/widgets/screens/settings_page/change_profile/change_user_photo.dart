import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeUserPhotoWidget extends StatelessWidget {
  const ChangeUserPhotoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PlatformBuilder(
          web: TextButton(
              onPressed: () {
                context.read<ImageBloc>().add(PickAndUploadImageEvent());
              },
              child: Text(
                AppLocalizations.of(context)!.changePhotoButton,
                style: TextStyle(
                    color: AppColors.accent.color,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.accent.color,
                    decorationStyle: TextDecorationStyle.solid,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              )),
          other: TextButton(
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => CupertinoActionSheet(
                          actions: <Widget>[
                            CupertinoActionSheetAction(
                                isDefaultAction: true,
                                child: _ActionSheetChild(
                                  icon: Icons.image,
                                  actionText: AppLocalizations.of(context)!
                                      .galleryButton,
                                ),
                                onPressed: () {
                                  context
                                      .read<ImageBloc>()
                                      .add(PickAndUploadImageEvent());
                                }),
                            CupertinoActionSheetAction(
                              child: _ActionSheetChild(
                                icon: Icons.camera_alt,
                                actionText:
                                    AppLocalizations.of(context)!.cameraButton,
                              ),
                              onPressed: () {
                                context
                                    .read<ImageBloc>()
                                    .add(PickfromCamAndUploadImageEvent());
                                context.pop();
                              },
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            child: Text(
                              AppLocalizations.of(context)!.cancelButton,
                              style: TextStyle(
                                  color: AppColors.accent.color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ));
              },
              child: Text(
                AppLocalizations.of(context)!.changePhotoButton,
                style: TextStyle(
                    color: AppColors.accent.color,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.accent.color,
                    decorationStyle: TextDecorationStyle.solid,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              )),
          builder: (context, child, widget) {
            return widget;
          }),
    );
  }
}

class _ActionSheetChild extends StatelessWidget {
  final String actionText;
  final IconData icon;
  const _ActionSheetChild({
    required this.actionText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.black.color),
        Text(
          actionText,
          style: TextStyle(
              color: AppColors.black.color,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CommonFavouriteListViewBody extends StatelessWidget {
  const CommonFavouriteListViewBody({
    Key? key,
    required this.song,
    required this.onTap,
    required this.child,
    required this.onDismissed,
    this.backgroundColor,
    this.deleteIconColor = Colors.white,
  }) : super(key: key);

  final SongModel song;
  final VoidCallback? onTap;
  final VoidCallback onDismissed;
  final Widget child;
  final Color? backgroundColor;
  final Color deleteIconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Dismissible(
        key: Key(song.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: backgroundColor ?? AppColors.accent.color,
          child: Icon(Icons.delete, color: deleteIconColor),
        ),
        onDismissed: (direction) {
          onDismissed();
        },
        child: child,
      ),
    );
  }
}

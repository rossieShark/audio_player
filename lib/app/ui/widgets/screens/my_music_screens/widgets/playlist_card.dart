import 'package:audio_player/app/domain/entity/models.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({super.key, required this.index, required this.folders});
  final int index;
  final List<FavoriteFolder> folders;
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return HoverableWidget(builder: (context, child, isHovered) {
      return SizedBox(
        height: 60,
        width: maxWidth - 32 < 0 ? 32 : maxWidth - 32,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                        width: 45,
                        height: 45,
                        child: Image.asset(folders[index].image,
                            fit: BoxFit.cover))),
              ),
              Text(
                folders[index].title,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: FontFamily.lusitana,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ]),
      );
    });
  }
}

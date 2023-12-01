import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestAlbumList extends StatelessWidget {
  const BestAlbumList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumBlocState>(builder: (context, state) {
      return state.map(
        error: (context) => const NoResultsWidget(),
        loading: (context) => const Center(
          child: CustomFadingCircleIndicator(),
        ),
        loaded: (data) => BestAlbumListBody(bestAlbumList: data.data),
      );
    });
  }
}

class BestAlbumListBody extends StatelessWidget {
  final List<BestAlbum>? bestAlbumList;
  const BestAlbumListBody({super.key, required this.bestAlbumList});
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = (maxWidth - maxWidth / 3) ~/ 220;

    return ResponsiveWidget(
      narrow: (context) => ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bestAlbumList!.length, (index) {
          return BestAlbumsContent(
              id: bestAlbumList![index].id,
              image: bestAlbumList![index].image,
              artist: bestAlbumList![index].artist,
              title: bestAlbumList![index].title);
        }),
      ),
      other: (context) => GridView.count(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        crossAxisCount: crossAxisCount,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: bestAlbumList!.asMap().entries.map((entry) {
          final index = entry.key;
          return BestAlbumsContent(
              id: bestAlbumList![index].id,
              image: bestAlbumList![index].image,
              artist: bestAlbumList![index].artist,
              title: bestAlbumList![index].title);
        }).toList(),
      ),
    );
  }
}

class BestAlbumsContent extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final String artist;

  const BestAlbumsContent(
      {super.key,
      required this.id,
      required this.artist,
      required this.image,
      required this.title});
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Uri(
          path: '/${routeNameMap[RouteName.albumDetail]!}$id',
          queryParameters: {'image': image, 'title': title, 'artist': artist},
        ).toString());
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: HoverableWidget(
          builder: (context, child, isHovered) {
            return AnimatedScale(
                scale: isHovered ? 1.04 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: child);
          },
          child: Stack(children: [
            _CreateBackgroundImage(maxWidth: maxWidth, image: image),
            const _CreateHoveredContainer(),
            _CreateAlbumTitle(artist: artist, title: title),
          ]),
        ),
      ),
    );
  }
}

class _CreateAlbumTitle extends StatelessWidget {
  const _CreateAlbumTitle({
    required this.artist,
    required this.title,
  });

  final String artist;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              TextModifierService().removeTextAfter(
                artist,
              ),
              style: TextStyle(
                  color: AppColors.white.color,
                  fontSize: 30,
                  fontFamily: FontFamily.lusitana,
                  fontWeight: FontWeight.w600),
              maxFontSize: 15,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            Text(
              TextModifierService().removeTextAfter(title),
              style: const TextStyle(
                  fontFamily: FontFamily.poiretOne,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateBackgroundImage extends StatelessWidget {
  const _CreateBackgroundImage({
    required this.maxWidth,
    required this.image,
  });

  final double maxWidth;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      narrow: 220.0,
      medium: 350.0,
      large: 350.0,
      builder: (context, child, height) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(height: height, width: maxWidth - 32, child: child),
        );
      },
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _CreateHoveredContainer extends StatelessWidget {
  const _CreateHoveredContainer();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: HoverableWidget(builder: (context, child, isHovered) {
        return Container(
          decoration: BoxDecoration(
            color: isHovered
                ? Colors.black.withOpacity(0.3)
                : Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }),
    );
  }
}

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class FavoriteArtistWidget extends StatelessWidget {
  const FavoriteArtistWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteBloc = BlocProvider.of<FavoriteArtistBloc>(context);
    favoriteBloc.add(FetchFavoriteArtistsEvent());
    return BlocBuilder<FavoriteArtistBloc, FavoriteArtistBlocState>(
        builder: (context, state) {
      return state.map(
        error: (context) => const NoResultsWidget(),
        loading: (context) => const Center(
          child: CustomFadingCircleIndicator(),
        ),
        loaded: (data) => FavouriteArtistBody(favoriteArtistList: data.data),
      );
    });
  }
}

class FavouriteArtistBody extends StatefulWidget {
  const FavouriteArtistBody({
    super.key,
    required this.favoriteArtistList,
  });

  final List<FavoriteArtist> favoriteArtistList;

  @override
  State<FavouriteArtistBody> createState() => _FavouriteArtistBodyState();
}

class _FavouriteArtistBodyState extends State<FavouriteArtistBody> {
  final ScrollController _horizontalScroll = ScrollController();

  bool _canScrollBack = false;
  bool _canScrollForward = true;

  @override
  void initState() {
    super.initState();

    _horizontalScroll.addListener(() {
      setState(() {
        _canScrollBack = _horizontalScroll.position.pixels > 0;
        _canScrollForward = _horizontalScroll.position.pixels <
            _horizontalScroll.position.maxScrollExtent;
      });
    });
  }

  @override
  void dispose() {
    _horizontalScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(builder: (context, child, isHovered) {
      return Stack(children: [
        ListView(
          controller: _horizontalScroll,
          scrollDirection: Axis.horizontal,
          children: List.generate(widget.favoriteArtistList.length, (index) {
            return FavoriteListContent(
                image: widget.favoriteArtistList[index].image,
                name: widget.favoriteArtistList[index].name);
          }),
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 20,
            child: CreateScrollButtons(
              canScrollBack: _canScrollBack,
              horizontalScroll: _horizontalScroll,
              canScrollForward: _canScrollForward,
              isHovered: isHovered,
            )),
      ]);
    });
  }
}

class FavoriteListContent extends StatelessWidget {
  const FavoriteListContent({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        ResponsiveBuilder(
          narrow: 78.0,
          medium: 115.0,
          large: 125.0,
          builder: (context, child, height) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(height / 2),
              child: SizedBox(
                height: height,
                width: height,
                child: child,
              ),
            );
          },
          child: Image.network(image, fit: BoxFit.cover),
        ),
        const SizedBox(
          height: 5,
        ),
        ResponsiveBuilder(
            narrow: 13.0,
            medium: 14.0,
            large: 14.0,
            builder: (context, child, size) {
              return Text(
                TextModifierService().removeTextAfter(name),
                style: TextStyle(
                  fontFamily: FontFamily.poiretOne,
                  fontSize: size,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              );
            }),
        const SizedBox(
          height: 5,
        ),
      ]),
    );
  }
}

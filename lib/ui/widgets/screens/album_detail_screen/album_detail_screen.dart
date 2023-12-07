import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/ui/widgets/screens/album_detail_screen/detail_album_index.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class AlbumDetailWidget extends StatefulWidget {
  final String param;
  final String image;
  final String title;
  final String artist;

  const AlbumDetailWidget(
      {super.key,
      required this.param,
      required this.image,
      required this.title,
      required this.artist});

  @override
  State<AlbumDetailWidget> createState() => _AlbumDetailWidgetState();
}

class _AlbumDetailWidgetState extends State<AlbumDetailWidget> {
  @override
  void initState() {
    super.initState();
    _fetchAlbumDetails();
  }

  @override
  void didUpdateWidget(covariant AlbumDetailWidget oldWidget) {
    if (widget.param != oldWidget.param) {
      _fetchAlbumDetails();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _fetchAlbumDetails() {
    BlocProvider.of<AlbumDetailBloc>(context).add(
      FetchAlbumDetailBlocEvent(widget.param),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumDetailBloc, AlbumDetailBlocState>(
        builder: (context, state) {
      return state.map(
        loading: (_) => const Center(
          child: CustomFadingCircleIndicator(),
        ),
        empty: (_) => const NoDataWidget(),
        error: (_) => const NoDataWidget(),
        loaded: (data) => AlbumDetailScreenBody(
          songList: data.albumDetailList,
          widget: widget,
        ),
      );
    });
  }
}

class AlbumDetailScreenBody extends StatelessWidget {
  const AlbumDetailScreenBody({
    super.key,
    required this.songList,
    required this.widget,
  });

  final List<DetailAlbum> songList;
  final AlbumDetailWidget widget;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        CreateBackgroundImage(
          imageUrl: widget.image,
        ),
        CreatePlayButtonSection(
            param: widget.param,
            title: widget.title,
            artist: widget.artist,
            image: widget.image,
            songList: songList),
        Positioned.fill(
          top: maxHeight / 2 - 50,
          child: SizedBox(
            width: maxWidth,
            child: DetailAlbumListView(image: widget.image, songList: songList),
          ),
        ),
      ]),
    );
  }
}

import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateGenresSection extends StatelessWidget {
  const CreateGenresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            AppLocalizations.of(context)!.browseAll,
            style: const TextStyle(
                fontFamily: FontFamily.lusitana,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
        const Center(
          child: _GenresList(),
        ),
      ],
    );
  }
}

class _GenresList extends StatefulWidget {
  const _GenresList();

  @override
  State<_GenresList> createState() => _GenresListState();
}

class _GenresListState extends State<_GenresList> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<GenresBloc>(context).add(FetchGenresEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresBloc, GenresBlocState>(
      builder: (context, state) {
        return state.map(
          error: (context) => const NoResultsWidget(),
          loading: (context) => const Center(
            child: CustomFadingCircleIndicator(),
          ),
          loaded: (data) => GenresGridView(
            genres: data.data,
          ),
        );
      },
    );
  }
}

class GenresGridView extends StatelessWidget {
  const GenresGridView({
    super.key,
    required this.genres,
  });

  final List<MusicGenre> genres;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final crossAxisCount = width ~/ 260;
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: crossAxisCount > 0 ? crossAxisCount : 3,
          scrollDirection: Axis.vertical,
          children: genres.asMap().entries.map((entry) {
            final index = entry.key;
            return GestureDetector(
              onTap: () {},
              child: HoverableWidget(builder: (context, child, isHovered) {
                return CreateGenresListContent(
                  name: genres[index].name,
                  image: genres[0].image,
                  isHovered: isHovered,
                );
              }),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CreateGenresListContent extends StatelessWidget {
  const CreateGenresListContent({
    super.key,
    required this.image,
    required this.name,
    required this.isHovered,
  });

  final String image;
  final String name;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isHovered ? 1.1 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: Stack(children: [
        _CreateImageSection(image: image),
        _CreateFilterLayer(isHovered: isHovered),
        _CreateTitle(name: name),
      ]),
    );
  }
}

class _CreateTitle extends StatelessWidget {
  const _CreateTitle({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
                fontFamily: FontFamily.poiretOne,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.white),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class _CreateFilterLayer extends StatelessWidget {
  const _CreateFilterLayer({
    required this.isHovered,
  });

  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: isHovered
              ? AppColors.accent.color.withOpacity(0.3)
              : AppColors.accent.color.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class _CreateImageSection extends StatelessWidget {
  const _CreateImageSection({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 300,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

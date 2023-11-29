import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritePageStructure extends StatelessWidget {
  const FavoritePageStructure({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        backgroundColor: AppColors.background.color,
        leading: PlatformBuilder(
            iOS: ResponsiveButton(
                iconData: Icons.arrow_back_ios,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                color: AppColors.white.color),
            other: ResponsiveButton(
                iconData: Icons.arrow_back,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                color: AppColors.white.color),
            builder: (context, child, data) {
              return IconButtonWidget(
                  iconData: data.iconData,
                  color: data.color,
                  onPressed: data.onPressed);
            }),
        actions: [
          IconButtonWidget(
              iconData: Icons.filter_list_alt,
              color: AppColors.accent.color,
              onPressed: () {
                final bloc = context.read<FavoriteSongBloc>();
                bloc.add(const SortSongsEvent());
              })
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: child),
    );
  }
}

class FavoriteBody extends StatelessWidget {
  final List<SongModel> songs;
  final Widget child;
  const FavoriteBody({
    super.key,
    required this.songs,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return songs.isEmpty ? const NoFavouritesTextWidget() : child;
  }
}

class NoFavouritesTextWidget extends StatelessWidget {
  const NoFavouritesTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      AppLocalizations.of(context)!.noMusicState,
      style: TextStyle(
          color: AppColors.white.color,
          fontSize: 18,
          fontFamily: AppFonts.colombia.font,
          fontWeight: FontWeight.w700),
    ));
  }
}

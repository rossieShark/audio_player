import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app_logic/blocs/language_bloc/language_bloc.dart';

import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/ui/theme/theme.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class AudioPlayerApp extends StatefulWidget {
  final GoRouter router;

  const AudioPlayerApp({Key? key, required this.router}) : super(key: key);

  @override
  State<AudioPlayerApp> createState() => _AudioPlayerAppState();
}

class _AudioPlayerAppState extends State<AudioPlayerApp> {
  @override
  void dispose() {
    context.read<TabBarBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<FavoriteSongBloc>(
          create: (context) => GetIt.I.get(),
        ),
        BlocProvider<FavoriteAlbumBloc>(
          create: (context) => GetIt.I.get(),
        ),
        BlocProvider<MyMusicFolderBlocBloc>(
          create: (context) =>
              GetIt.I.get()..add(const LoadMyMusicFoldersEvent()),
        ),
        BlocProvider<RecentlyPlayedIdCubit>(
          create: (context) => GetIt.I.get(),
        ),
        BlocProvider<RecentlySearchedBloc>(
          create: (context) =>
              GetIt.I.get()..add(const LoadRecentlySearchedEvent()),
        ),
        ChangeNotifierProvider<MusicProvider>(
            create: (context) => GetIt.I.get()),
      ],
      child: BlocBuilder<LanguageBloc, Locale?>(builder: (context, state) {
        return MaterialApp.router(
          routerConfig: widget.router,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: state,
          supportedLocales:
              BlocProvider.of<LanguageBloc>(context).supportedLocales,
          theme: ThemeData(
              splashColor: Colors.transparent,
              textTheme: TextTheme(
                titleLarge: TextStyle(
                    color: AppColors.white.color,
                    fontSize: 30,
                    fontFamily: AppFonts.lusitana.font,
                    fontWeight: FontWeight.w400),
                titleMedium: TextStyle(
                    color: AppColors.white.color,
                    fontSize: 25,
                    fontFamily: AppFonts.lusitana.font,
                    fontWeight: FontWeight.w400),
                titleSmall: TextStyle(
                    color: AppColors.white.color,
                    fontSize: 22,
                    fontFamily: AppFonts.lusitana.font,
                    fontWeight: FontWeight.w500),
              ),
              navigationRailTheme: AppThemeData().createNavBarTheme(),
              bottomNavigationBarTheme:
                  AppThemeData().createBottomNavigationBarTheme(),
              primarySwatch: Colors.pink,
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              hoverColor: Colors.transparent),
        );
      }),
    );
  }
}

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app_logic/blocs/favourites_bloc/favourite_song_bloc/favourites_song_bloc.dart';
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
    final languageProvider = Provider.of<LanguageProvider>(context);
    return MultiProvider(
      providers: [
        BlocProvider<FavoriteSongBloc>(
          create: (context) => GetIt.I.get(),
        ),
        ChangeNotifierProvider<RecentlySearchedProvider>(
          create: (context) {
            final RecentlySearchedProvider provider = GetIt.I.get();
            provider.loadRecentlySearched();
            return provider;
          },
        ),
        ChangeNotifierProvider<RecentlyPlayedIdProvider>(
          create: (context) => RecentlyPlayedIdProvider(),
        ),
        ChangeNotifierProvider<MyMusicFoldersProvider>(create: (context) {
          final MyMusicFoldersProvider provider = GetIt.I.get();
          provider.loadFolders();
          return provider;
        }),
        ChangeNotifierProvider<MusicProvider>(
            create: (context) => GetIt.I.get()),
      ],
      child: MaterialApp.router(
        routerConfig: widget.router,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: languageProvider.appLocale,
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
          Locale('de'),
        ],
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
      ),
    );
  }
}

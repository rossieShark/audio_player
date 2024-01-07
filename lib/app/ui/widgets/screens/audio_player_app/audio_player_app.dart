import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/app_logic/blocs/filter_bloc.dart';
import 'package:audio_player/app/di/init_di.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
        BlocProvider<AlbumDetailBloc>(
          create: (context) => getIt<AlbumDetailBloc>(),
        ),
        BlocProvider<FavoriteSongBloc>(
          create: (context) => getIt<FavoriteSongBloc>(),
        ),
        BlocProvider<FavoriteAlbumBloc>(
          create: (context) => getIt<FavoriteAlbumBloc>(),
        ),
        BlocProvider<SearchFilterBloc>(
          create: (context) => getIt<SearchFilterBloc>(),
        ),
        BlocProvider<NewPlaylistBloc>(
          create: (context) => getIt<NewPlaylistBloc>(),
        ),
        BlocProvider<PasswordMissmatchCubit>(
          create: (context) => getIt<PasswordMissmatchCubit>(),
        ),
        BlocProvider<RecentlySearchedBloc>(
          create: (context) => getIt<RecentlySearchedBloc>(),
        ),
        BlocProvider<MusicBloc>(
          create: (context) => getIt<MusicBloc>(),
        ),
        BlocProvider<ImageBloc>(
          create: (context) => getIt<ImageBloc>(),
        ),
        BlocProvider<DetailMusicPageBloc>(
          create: (context) => getIt<DetailMusicPageBloc>(),
        ),
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
              textTheme: AppThemeData().createTextTheme(),
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

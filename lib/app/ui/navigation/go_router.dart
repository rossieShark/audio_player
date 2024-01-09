import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/di/init_di.dart';
import 'package:audio_player/app/ui/navigation/navigation_routes.dart';
import 'package:audio_player/app/ui/widgets/screens/audio_player_app/main_app_runner.dart';
import 'package:audio_player/app/ui/widgets/screens/index.dart';
import 'package:audio_player/app/ui/widgets/screens/onboarding_screen/onboarding_screen.dart';
import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _webNavKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _webShellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: initScreen == 0 || initScreen == null ? "/onboarding" : "/",
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/onboarding',
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: OnboardingScreen(),
      ),
    ),
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, widget) => TabBarContent(
              key: state.pageKey,
              child: widget,
            ),
        routes: [
          GoRoute(
            path: Routes().home,
            pageBuilder: (context, state) => CupertinoPage(
              key: state.pageKey,
              child: const HomePage().createWithMultiProviders([
                BlocProvider<AlbumBloc>(
                  create: (_) => getIt<AlbumBloc>(),
                ),
                BlocProvider<FavoriteArtistBloc>(
                  create: (context) => getIt<FavoriteArtistBloc>(),
                ),
                BlocProvider<RecentlyPlayedBloc>(
                  create: (context) => getIt<RecentlyPlayedBloc>(),
                ),
              ]),
            ),
            redirect: (BuildContext context, GoRouterState state) {
              final FirebaseAuth auth = FirebaseAuth.instance;
              if (auth.currentUser == null) {
                return Routes().start;
              } else {
                return null;
              }
            },
          ),
          GoRoute(
            path: Routes().search,
            pageBuilder: (context, state) => CupertinoPage(
              key: state.pageKey,
              child: const SearchPage().createWithMultiProviders([
                BlocProvider<SearchResultBloc>(
                  create: (context) => getIt<SearchResultBloc>(),
                ),
                BlocProvider<GenresBloc>(
                  create: (context) => getIt<GenresBloc>(),
                ),
              ]),
            ),
          ),
          GoRoute(
            path: Routes().myMusic,
            pageBuilder: (context, state) => CupertinoPage(
              key: state.pageKey,
              child: const MyMusicPage(),
            ),
          ),
        ]),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/${Routes().tracks}',
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const MyFavoriteSongs().createWithMultiProviders([
          BlocProvider<FavoriteSongBloc>(
            create: (context) => getIt<FavoriteSongBloc>(),
          ),
        ]),
      ),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/${Routes().playlist}',
      pageBuilder: (context, state) =>
          CupertinoPage(key: state.pageKey, child: const NewPlaylistContent()),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/${Routes().albums}',
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const MyFavoriteAlbum(),
      ),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/${Routes().albumDetail}:id',
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: AlbumDetailWidget(
          param: state.pathParameters['id'] ?? '',
          image: state.uri.queryParameters['image'] ?? '',
          title: state.uri.queryParameters['title'] ?? '',
          artist: state.uri.queryParameters['artist'] ?? '',
        ),
      ),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/${Routes().settings}',
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const Settings(),
      ),
    ),
    GoRoute(
        path: Routes().start,
        pageBuilder: (context, state) => const CupertinoPage(
              child: StartPage(),
            )),
    GoRoute(
      path: Routes().signIn,
      pageBuilder: (context, state) => const CupertinoPage(
        child: SignInPage(),
      ),
    ),
    GoRoute(
      path: Routes().signUp,
      pageBuilder: (context, state) => const CupertinoPage(
        child: SignUpPage(),
      ),
    ),
  ],
);

final webRouter =
    GoRouter(navigatorKey: _webNavKey, initialLocation: Routes().home, routes: [
  ShellRoute(
      navigatorKey: _webShellNavigatorKey,
      builder: (context, state, widget) => TabBarContent(
            key: state.pageKey,
            child: widget,
          ),
      routes: [
        GoRoute(
            path: Routes().home,
            pageBuilder: (context, state) => CupertinoPage(
                  key: state.pageKey,
                  child: const HomePage().createWithMultiProviders([
                    BlocProvider<AlbumBloc>(
                      create: (_) => getIt<AlbumBloc>(),
                    ),
                    BlocProvider<FavoriteArtistBloc>(
                      create: (context) => getIt<FavoriteArtistBloc>(),
                    ),
                    BlocProvider<RecentlyPlayedBloc>(
                      create: (context) => getIt<RecentlyPlayedBloc>(),
                    ),
                  ]),
                ),
            redirect: (BuildContext context, GoRouterState state) {
              final FirebaseAuth auth = FirebaseAuth.instance;
              if (auth.currentUser == null) {
                return Routes().start;
              } else {
                return null;
              }
            },
            routes: [
              GoRoute(
                path: '${Routes().albumDetail}:id',
                pageBuilder: (context, state) => CupertinoPage(
                    key: state.pageKey,
                    child: AlbumDetailWidget(
                      param: state.pathParameters['id'] ?? '',
                      image: state.uri.queryParameters['image'] ?? '',
                      title: state.uri.queryParameters['title'] ?? '',
                      artist: state.uri.queryParameters['artist'] ?? '',
                    )),
              ),
              GoRoute(
                path: Routes().tracks,
                pageBuilder: (context, state) =>
                    const CupertinoPage(child: MyFavoriteSongs()),
              ),
              GoRoute(
                path: Routes().albums,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: MyFavoriteAlbum(),
                ),
              ),
              GoRoute(
                path: Routes().playlist,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: NewPlaylistContent(),
                ),
              ),
            ]),
        GoRoute(
          path: Routes().myMusic,
          pageBuilder: (context, state) => CupertinoPage(
            key: state.pageKey,
            child: const MyMusicPage(),
          ),
        ),
        GoRoute(
          path: Routes().search,
          pageBuilder: (context, state) => CupertinoPage(
            key: state.pageKey,
            child: const SearchPage().createWithMultiProviders([
              BlocProvider<SearchResultBloc>(
                create: (context) => getIt<SearchResultBloc>(),
              ),
              BlocProvider<GenresBloc>(
                create: (context) => getIt<GenresBloc>(),
              ),
            ]),
          ),
        ),
      ]),
  GoRoute(
    path: '/${Routes().settings}',
    pageBuilder: (context, state) => const CupertinoPage(
      child: Settings(),
    ),
  ),
  GoRoute(
      path: Routes().start,
      pageBuilder: (context, state) => const CupertinoPage(
            child: StartPage(),
          )),
  GoRoute(
    path: Routes().signIn,
    pageBuilder: (context, state) => const CupertinoPage(
      child: SignInPage(),
    ),
  ),
  GoRoute(
    path: Routes().signUp,
    pageBuilder: (context, state) => const CupertinoPage(
      child: SignUpPage(),
    ),
  ),
]);

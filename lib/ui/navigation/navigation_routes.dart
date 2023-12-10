import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationUtils {
  static void mobileHandleTabTap(BuildContext context, int index) {
    final tabBarBloc = context.read<TabBarBloc>();
    tabBarBloc.setTabIndex(index);

    switch (index) {
      case 0:
        context.go(Routes().myMusic);
        break;
      case 1:
        context.go(Routes().home);
        break;

      case 2:
        context.go(Routes().search);
        break;
    }
  }

  static void WebHandleTabTap(BuildContext context, int index) {
    final tabBarBloc = context.read<TabBarBloc>();
    tabBarBloc.setTabIndex(index);

    switch (index) {
      case 0:
        context.go(Routes().search);
        break;
      case 1:
        context.go(Routes().home);
        break;
    }
  }
}

// enum RouteName {
//   home,
//   myMusic,
//   search,
//   favoriteTracks,
//   favoriteAlbums,
//   detailMusic,
//   albumDetail,
//   settings,
//   sigIn,
//   signUp,
//   start,
// }

class Routes {
  final String _home = '/';
  final String _search = '/search';
  final String _myMusic = '/my_music';
  final String _tracks = 'tracks';
  final String _albums = 'albums';
  final String _detailMusic = 'detail_music/';
  final String _albumDetail = 'album_detail/';
  final String _settings = 'settings';
  final String _signin = '/signin';
  final String _signup = '/signup';
  final String _start = '/start';
  final String _playlist = 'playlist';

  String get home => _home;
  String get search => _search;
  String get myMusic => _myMusic;
  String get tracks => _tracks;
  String get albums => _albums;
  String get detailTrack => _detailMusic;
  String get albumDetail => _albumDetail;
  String get settings => _settings;
  String get signIn => _signin;
  String get signUp => _signup;
  String get start => _start;
  String get playlist => _playlist;
}

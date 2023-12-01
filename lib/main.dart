import 'package:audio_player/firebase_options.dart';
import 'package:audio_player/ui/navigation/go_router.dart';

import 'package:audio_player/ui/widgets/screens/audio_player_app/audio_player_app.dart';

import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app_logic/blocs/bloc_exports.dart';

void main() async {
  await _initialiseMain();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TabBarBloc>(create: (context) => GetIt.I()),
        BlocProvider<LanguageBloc>(
          create: (context) {
            final languageBloc = LanguageBloc(GetIt.I());
            languageBloc.loadSavedLanguage();
            return languageBloc;
          },
        ),
      ],
      child: PlatformBuilder(
          web: AudioPlayerApp(
            router: webRouter,
          ),
          other: AudioPlayerApp(
            router: router,
          ),
          builder: (context, child, widget) {
            return widget;
          }),
    ),
  );
}

Future<void> _initialiseMain() async {
  SetGetItDependencies().setupDatabaseDependencies();
  SetGetItDependencies().setupProviderDependencies();
  SetGetItDependencies().setupRepoDependencies();
  SetGetItDependencies().setupBlocDependencies();
  SetGetItDependencies().setupServiceDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

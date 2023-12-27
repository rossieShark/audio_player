import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/interfaces/app_builder.dart';
import 'package:audio_player/ui/navigation/go_router.dart';
import 'package:audio_player/ui/widgets/screens/audio_player_app/audio_player_app.dart';
import 'package:audio_player/ui/widgets/widgets/responsive_widgets/platform_widget/platform_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MainAppBuilder implements AppBuilder {
  @override
  Widget buildApp() {
    return MultiBlocProvider(
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
    );
  }
}

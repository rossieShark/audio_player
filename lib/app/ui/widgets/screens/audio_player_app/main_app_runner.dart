// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audio_player/app/di/init_di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

import 'package:audio_player/app/domain/interfaces/app_builder.dart';
import 'package:audio_player/app/domain/interfaces/app_runner.dart';
import 'package:audio_player/firebase_options.dart';

class MainAppRunner implements AppRunner {
  final String env;
  const MainAppRunner(this.env);

  @override
  Future<void> preloadData() async {
    WidgetsFlutterBinding.ensureInitialized();
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      // ignore: avoid_print
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    });
    configureDependencies(env);
    // _initialiseMain();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    await preloadData();
    runApp(appBuilder.buildApp());
  }
}



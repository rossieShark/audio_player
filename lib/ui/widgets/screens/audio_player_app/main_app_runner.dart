import 'package:audio_player/domain/interfaces/app_builder.dart';
import 'package:audio_player/domain/interfaces/app_runner.dart';
import 'package:audio_player/domain/services/get_it_dependencies/get_it_dependencies.dart';
import 'package:audio_player/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

class MainAppRunner implements AppRunner {
  @override
  Future<void> preloadData() async {
    WidgetsFlutterBinding.ensureInitialized();
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      // ignore: avoid_print
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    });
    _initialiseMain();
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

void _initialiseMain() {
  SetGetItDependencies().setupDatabaseDependencies();
  SetGetItDependencies().setupProviderDependencies();
  SetGetItDependencies().setupRepoDependencies();
  SetGetItDependencies().setupBlocDependencies();
  SetGetItDependencies().setupServiceDependencies();
}

import 'package:audio_player/domain/interfaces/app_builder.dart';

abstract class AppRunner {
  Future<void> preloadData();
  Future<void> run(AppBuilder appBuilder);
}

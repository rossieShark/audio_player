import 'package:audio_player/ui/widgets/screens/audio_player_app/main_app_builder.dart';
import 'package:audio_player/ui/widgets/screens/audio_player_app/main_app_runner.dart';

void main() async {
  final runner = MainAppRunner();
  final builder = MainAppBuilder();
  runner.run(builder);
}

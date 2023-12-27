import 'package:audio_player/domain/services/api_service/service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'init_di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies(String env) => getIt.init(environment: env);

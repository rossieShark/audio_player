import 'package:audio_player/domain/services/api_service/service.dart';
import 'package:audio_player/domain/services/image_picker_service/image_picker_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  AudioPlayerService get audioPlayerService => AudioPlayerService.create();

  @lazySingleton
  AudioPlayer get audioPlayer => AudioPlayer();

  @factoryMethod
  ImagePickerService get imagePickerService {
    return ImagePickerService();
  }
}

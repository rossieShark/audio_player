import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:audio_player/domain/services/services.dart';
import 'package:logging/logging.dart';

class ImageBloc extends Bloc<ImageBlocEvents, ImageBlocState> {
  final ImagePickerService _imagePickerService;
  final Logger _logger = getLogger('ImageBloc');
  ImageBloc(this._imagePickerService) : super(ImageBlocState(image: null)) {
    on<PickAndUploadImageEvent>(_onPickAndUploadImageEvent);
    on<PickfromCamAndUploadImageEvent>(_onPickfromCamAndUploadImageEvent);
  }

  void _onPickAndUploadImageEvent(
      PickAndUploadImageEvent event, Emitter<ImageBlocState> emit) async {
    try {
      final imageUrl = await _imagePickerService.pickImageFromGallery();
      _logger.info('imageUrl: $imageUrl');
      if (imageUrl != null) {
        emit(ImageBlocState(image: imageUrl));
      }
    } catch (error, stackTrace) {
      _logger.severe(
          'Error during picking photo from library: $error, stack trace: $stackTrace');
    }
  }

  void _onPickfromCamAndUploadImageEvent(PickfromCamAndUploadImageEvent event,
      Emitter<ImageBlocState> emit) async {
    try {
      final imageUrl = await _imagePickerService.pickImageFromCamera();
      if (imageUrl != null) {
        emit(ImageBlocState(image: imageUrl));
      }
    } catch (error, stackTrace) {
      _logger.severe(
          'Error during picking photo from camera: $error, stack trace: $stackTrace');
    }
  }
}

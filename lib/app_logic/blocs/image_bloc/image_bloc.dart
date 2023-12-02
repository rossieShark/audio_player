import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/services/services.dart';

class ImageBloc extends Bloc<ImageBlocEvents, ImageBlocState> {
  final ImagePickerService _imagePickerService;
  ImageBloc(this._imagePickerService) : super(ImageBlocState(image: null)) {
    on<PickAndUploadImageEvent>(_onPickAndUploadImageEvent);
    on<PickfromCamAndUploadImageEvent>(_onPickfromCamAndUploadImageEvent);
  }

  void _onPickAndUploadImageEvent(
      PickAndUploadImageEvent event, Emitter<ImageBlocState> emit) async {
    final imageUrl = await _imagePickerService.pickImageFromGallery();
    print(imageUrl);
    if (imageUrl != null) {
      emit(ImageBlocState(image: imageUrl));
    }
  }

  void _onPickfromCamAndUploadImageEvent(PickfromCamAndUploadImageEvent event,
      Emitter<ImageBlocState> emit) async {
    final imageUrl = await _imagePickerService.pickImageFromCamera();
    if (imageUrl != null) {
      emit(ImageBlocState(image: imageUrl));
    }
  }
}

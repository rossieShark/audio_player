import 'dart:io';

import 'package:audio_player/app/domain/services/logger.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';

class ImagePickerService {
  final _picker = ImagePicker();
  final Logger _logger = getLogger('ImagePickerService io');
  Future<String?> pickImageFromGallery() async {
    try {
      final image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 200,
        maxWidth: 200,
      );

      if (image == null) {
        return null;
      }

      final imageTemp = File(image.path);
      final ref = FirebaseStorage.instance
          .ref()
          .child('userProfileImage')
          .child('${DateTime.now()}.jpg');
      await ref.putFile(imageTemp);

      final imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error picking/uploading image: $error, stack trace: $stackTrace');
      return null;
    }
  }

  Future<String?> pickImageFromCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    }

    final imageTemp = File(image.path);
    final ref = FirebaseStorage.instance
        .ref()
        .child('userProfileImage')
        .child('${DateTime.now()}.jpg');
    await ref.putFile(imageTemp);

    final imageUrl = await ref.getDownloadURL();
    return imageUrl;
  }
}

// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:audio_player/domain/services/logger.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logging/logging.dart';

class ImagePickerService {
  final Logger _logger = getLogger('ImagePickerService html');
  Future<String?> pickImageFromGallery() async {
    final uploadInput = FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    final completer = Completer<String?>();

    uploadInput.onChange.listen((event) async {
      final files = uploadInput.files;
      final file = files![0];
      final reader = FileReader();

      reader.onLoadEnd.listen((event) async {
        final bytesData = const Base64Decoder()
            .convert(reader.result.toString().split(",").last);

        final ref = FirebaseStorage.instance
            .ref()
            .child('userProfileImage')
            .child('${DateTime.now()}.jpg');

        try {
          await ref.putData(bytesData);
          final imageUrl = await ref.getDownloadURL();
          completer.complete(imageUrl);
        } catch (error, stackTrace) {
          _logger.severe(
              'Error uploading image: $error, stack trace: $stackTrace');
          completer.completeError(error);
        }
      });

      reader.readAsDataUrl(file);
    });

    return completer.future;
  }

  Future<String?> pickImageFromCamera() {
    return Future.value(null);
  }
}

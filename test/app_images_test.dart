import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:audio_player/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.album).existsSync(), isTrue);
    expect(File(AppImages.apple).existsSync(), isTrue);
    expect(File(AppImages.black).existsSync(), isTrue);
    expect(File(AppImages.facebook).existsSync(), isTrue);
    expect(File(AppImages.google).existsSync(), isTrue);
    expect(File(AppImages.laptop).existsSync(), isTrue);
    expect(File(AppImages.onboarding1).existsSync(), isTrue);
    expect(File(AppImages.onboarding2).existsSync(), isTrue);
    expect(File(AppImages.onboarding3).existsSync(), isTrue);
    expect(File(AppImages.playlist).existsSync(), isTrue);
    expect(File(AppImages.sound).existsSync(), isTrue);
    expect(File(AppImages.sound1152).existsSync(), isTrue);
    expect(File(AppImages.soundLogo).existsSync(), isTrue);
    expect(File(AppImages.track).existsSync(), isTrue);
    expect(File(AppImages.user).existsSync(), isTrue);
  });
}

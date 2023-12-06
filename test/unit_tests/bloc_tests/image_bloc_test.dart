import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/services/services.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockImagePickerService extends Mock implements ImagePickerService {}

void main() {
  group('ImageBlocTest', () {
    late ImageBloc bloc;
    late MockImagePickerService service;

    setUp(() {
      service = MockImagePickerService();
      bloc = ImageBloc(service);
    });

    blocTest<ImageBloc, ImageBlocState>(
      'emits ImageBlocState when PickAndUploadImageEvent is added',
      build: () {
        // Stub the service to return a mock image path when picking from the gallery
        when(() => service.pickImageFromGallery())
            .thenAnswer((_) async => 'image' as String?);
        return bloc;
      },
      act: (bloc) => bloc.add(PickAndUploadImageEvent()),
      verify: (bloc) {
        // Verify that the emitted state is of the expected type and contains the correct image path
        expect(bloc.state, isA<ImageBlocState>());
        expect(bloc.state.image, 'image');
      },
    );

    blocTest<ImageBloc, ImageBlocState>(
      'emits ImageBlocState when PickfromCamAndUploadImageEvent is added',
      build: () {
        // Stub the service to return a mock image path when picking from the camera
        when(() => service.pickImageFromCamera())
            .thenAnswer((_) async => 'image' as String?);
        return bloc;
      },
      act: (bloc) => bloc.add(PickfromCamAndUploadImageEvent()),
      verify: (bloc) {
        // Verify that the emitted state is of the expected type and contains the correct image path
        expect(bloc.state, isA<ImageBlocState>());
        expect(bloc.state.image, 'image');
      },
    );
  });
}

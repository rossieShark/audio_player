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
        when(() => service.pickImageFromGallery())
            .thenAnswer((_) async => 'image' as String?);
        return bloc;
      },
      act: (bloc) => bloc.add(PickAndUploadImageEvent()),
      verify: (bloc) {
        // Access the emitted state using bloc.state
        expect(bloc.state, isA<ImageBlocState>());
        expect(bloc.state.image, 'image');
      },
    );

    blocTest<ImageBloc, ImageBlocState>(
      'emits ImageBlocState when PickfromCamAndUploadImageEvent is added',
      build: () {
        when(() => service.pickImageFromCamera())
            .thenAnswer((_) async => 'image' as String?);
        return bloc;
      },
      act: (bloc) => bloc.add(PickfromCamAndUploadImageEvent()),
      verify: (bloc) {
        // Access the emitted state using bloc.state
        expect(bloc.state, isA<ImageBlocState>());
        expect(bloc.state.image, 'image');
      },
    );
  });
}

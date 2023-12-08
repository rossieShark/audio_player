import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/ui/widgets/screens/settings_page/change_profile/change_user_photo.dart';
import 'package:audio_player/ui/widgets/screens/settings_page/settings_index.dart';
import 'package:audio_player/ui/widgets/screens/settings_page/settings_page.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../firebase.dart';
import '../home_screen/golden_image.dart';
import '../testable_widget_sample.dart';

class MockPasswordMissmatchCubit extends MockCubit<String>
    implements PasswordMissmatchCubit {}

class MockImageBloc extends MockBloc<ImageBlocEvents, ImageBlocState>
    implements ImageBloc {}

void main() {
  // Setup Firebase authentication mocks
  setupFirebaseAuthMocks();

  // Setup Firebase initialization for all tests
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('Setting Screen Widget Tests', () {
    late MockPasswordMissmatchCubit cubit;
    late MockImageBloc bloc;
    late String image;

    setUp(() {
      cubit = MockPasswordMissmatchCubit();
      bloc = MockImageBloc();
      image = returnTestImage();
    });

    testWidgets('renders loading state', (WidgetTester tester) async {
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TestableWidget().makeTestableWidget(child: const Settings()),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Loading state is rendered
      expect(find.byType(SettingsList), findsOneWidget);
    });

    testWidgets('ChangePassword', (WidgetTester tester) async {
      // Stub the behavior of the cubit
      when(() => cubit.passwordMissmatchText('password Mismatch'))
          .thenReturn((_) {});
      when(() => cubit.state).thenAnswer((_) {
        return ''; // or any other value you want to return
      });
      whenListen<String>(
        cubit,
        Stream.value('password Mismatch'),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TestableWidget().makeTestableWidget(
              child: BlocProvider<PasswordMissmatchCubit>(
                create: (context) => cubit,
                child: const ChangePassword(),
              ),
            ),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Loading state is rendered
      expect(find.byType(CreatePasswordTextField), findsWidgets);
      expect(find.byType(CustomButton), findsOneWidget);

      // Enter text and tap the button
      await tester.enterText(
          find.byType(CreatePasswordTextField).at(0), 'current_password');
      await tester.enterText(
          find.byType(CreatePasswordTextField).at(1), 'new_password');
      await tester.tap(find.byType(CustomButton));

      // Rebuild the widget after the state has changed.
      await tester.pump();

      // Verify the expected text is displayed
      expect(find.text('password Mismatch'), findsOneWidget);
    });

    testWidgets('ChangeUserinfo', (WidgetTester tester) async {
      // Stub the behavior of the bloc
      when(() => bloc.state).thenAnswer((_) {
        return ImageBlocState(
            image: image); // or any other value you want to return
      });
      whenListen<ImageBlocState>(
        bloc,
        Stream<ImageBlocState>.fromIterable([ImageBlocState(image: image)]),
      );

      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TestableWidget().makeTestableWidget(
              child: BlocProvider<ImageBloc>(
                create: (context) => bloc,
                child: ChangeUserinfo(),
              ),
            ),
          ),
        ),
      );
      await tester.pump(Duration.zero);

      // Verify that the Loading state is rendered
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ChangeUserPhotoWidget), findsOneWidget);
    });
  });
}

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/ui/widgets/screens/log_pages/sign_in/sign_in_page.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../firebase.dart';
import '../testable_widget_sample.dart';

class MockPasswordMissmatchCubit extends MockCubit<String>
    implements PasswordMissmatchCubit {}

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('SignInPage Widget Tests', () {
    late MockPasswordMissmatchCubit cubit;

    setUp(() {
      cubit = MockPasswordMissmatchCubit();
    });

    testWidgets('SignInPage widgets and interactions',
        (WidgetTester tester) async {
      // Stub the state of the PasswordMissmatchCubit.
      when(() => cubit.state).thenAnswer((_) {
        return ''; // or any other value you want to return
      });

      // Stub the stream of the PasswordMissmatchCubit.
      whenListen<String>(
        cubit,
        Stream.value('password Mismatch'),
      );

      // Build the widget and trigger a frame.
      await tester.pumpWidget(
        TestableWidget().makeTestableWidget(
          child: BlocProvider<PasswordMissmatchCubit>(
            create: (context) => cubit,
            child: const SignInPage(),
          ),
        ),
      );

      // Verify that the initial state is as expected.
      expect(find.text('Enter email'), findsOneWidget);
      expect(find.text('Enter password'), findsOneWidget);
      expect(find.text('Forgot password'), findsOneWidget);

      // Simulate user interactions.
      await tester.enterText(find.byType(TextField).first, 'test@example.com');
      await tester.enterText(find.byType(TextField).last, 'password');
      await tester.tap(find.text(' Sign In'));
      await tester.pumpAndSettle();

      // Verify that the expected interactions have occurred.
      expect(find.byType(CustomButton), findsOneWidget);
      expect(find.text("Do not have an account?"), findsOneWidget);
      expect(find.text(' Sign Up'), findsOneWidget);
    });
  });
}

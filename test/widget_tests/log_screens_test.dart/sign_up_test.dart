import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/ui/widgets/screens/log_pages/sign_up/sign_up_screen.dart';
import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
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

  group('SignUpPage Widget Tests', () {
    late MockPasswordMissmatchCubit cubit;

    setUp(() {
      cubit = MockPasswordMissmatchCubit();
    });

    testWidgets('SignUpPage widgets and interactions',
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

      // Build the SignUpPage widget.
      await tester.pumpWidget(
        TestableWidget().makeTestableWidget(
          child: BlocProvider<PasswordMissmatchCubit>(
            create: (context) => cubit,
            child: const SignUpPage(),
          ),
        ),
      );

      // Verify that the initial state is as expected.
      expect(find.text('Enter email'), findsOneWidget);
      expect(find.text('Enter password'), findsOneWidget);

      // Simulate user interactions.
      await tester.enterText(find.byType(TextField).first, 'test@example.com');
      await tester.enterText(find.byType(TextField).last, 'password');
      await tester.tap(find.text(' Sign Up'));
      await tester.pumpAndSettle();

      // Verify that the expected interactions have occurred.
      expect(find.byType(CustomButton), findsOneWidget);
      expect(find.text("Already have an account? "), findsOneWidget);
      expect(find.text(' Sign In'), findsOneWidget);
    });
  });
}

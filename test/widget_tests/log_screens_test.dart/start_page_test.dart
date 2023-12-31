import 'package:audio_player/app/ui/widgets/screens/log_pages/start_page/start_page.dart';
import 'package:audio_player/app/ui/navigation/navigation_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../testable_widget_sample.dart';

void main() {
  testWidgets('StartPage widgets and interactions',
      (WidgetTester tester) async {
    final mockGoRouter = MockGoRouter();
    // Build the StartPage widget.
    await tester.pumpWidget(TestableWidget().makeTestableWidget(
        child: MockGoRouterProvider(
            goRouter: mockGoRouter, child: const StartPage())));

    // Verify that the initial state is as expected.
    expect(find.text('Louder'), findsOneWidget);
    expect(
        find.text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
        findsOneWidget);

    // Simulate user interactions.
    await tester.tap(find.text(' Sign In'));
    await tester.pumpAndSettle();

    // Verify that the expected interactions have occurred.
    expect(find.text(" Sign In"), findsOneWidget);
    expect(find.text(' Sign Up'), findsOneWidget);
    verify(() => mockGoRouter.go(Routes().signIn)).called(1);
    verifyNever(() => mockGoRouter.go(Routes().signUp));

    // Simulate user interactions.
    await tester.tap(find.text(' Sign Up'));
    await tester.pumpAndSettle();
    // Verify that the expected interactions have occurred.
    expect(find.text(' Sign Up'), findsOneWidget);
    verify(() => mockGoRouter.go(Routes().signUp)).called(1);
  });
}

class MockGoRouter extends Mock implements GoRouter {}

class MockGoRouterProvider extends StatelessWidget {
  const MockGoRouterProvider({
    required this.goRouter,
    required this.child,
    Key? key,
  }) : super(key: key);

  /// The mock navigator used to mock navigation calls.
  final MockGoRouter goRouter;

  /// The child [Widget] to render.
  final Widget child;

  @override
  Widget build(BuildContext context) => InheritedGoRouter(
        goRouter: goRouter,
        child: child,
      );
}

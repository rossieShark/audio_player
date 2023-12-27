import 'package:animate_gradient/animate_gradient.dart';

import 'package:audio_player/app/ui/widgets/widgets/custom_containers_widgets/animated_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomAnimatedContainer widget test',
      (WidgetTester tester) async {
    // Build the CustomAnimatedContainer widget.
    await tester.pumpWidget(
      const MaterialApp(
        home: CustomAnimatedContainer(),
      ),
    );

    // Verify that the widget is initially displayed.
    expect(find.byType(CustomAnimatedContainer), findsOneWidget);
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.byType(AnimateGradient), findsOneWidget);

    expect(find.byType(Icon), findsOneWidget);
  });
}

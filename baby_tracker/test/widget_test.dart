import 'package:flutter_test/flutter_test.dart';
import 'package:baby_tracker/app.dart';

void main() {
  testWidgets('Welcome screen shows Get Started button', (
    WidgetTester tester,
  ) async {
    // Build app
    await tester.pumpWidget(const BabyMoodTracker());

    // Look for "Get Started" button
    expect(find.text('Get Started'), findsOneWidget);

    // Tap on button
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // After tapping, user should go to Baby Setup screen
    expect(find.text('Setup Baby Profile'), findsOneWidget);
  });
}

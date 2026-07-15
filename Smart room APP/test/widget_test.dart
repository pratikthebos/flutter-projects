import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_apps/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartWalletApp());

    expect(find.byType(SmartWalletApp), findsOneWidget);
  });
}
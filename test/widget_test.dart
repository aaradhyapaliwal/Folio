import 'package:flutter_test/flutter_test.dart';
import 'package:folio/main.dart';

void main() {
  testWidgets('FolioApp smokescreen test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FolioApp());

    // Expect to find the main application title or branding elements
    expect(find.text('Folio'), findsWidgets);
  });
}

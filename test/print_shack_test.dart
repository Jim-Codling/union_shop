import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/print_shack_about_page.dart';
import 'package:union_shop/print_shack_personalisation_page.dart';

void main() {
  group('Print Shack Pages Tests', () {
    testWidgets('PrintShackAboutPage builds', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: PrintShackAboutPage()));
      expect(find.byType(PrintShackAboutPage), findsOneWidget);
    });

    testWidgets('PrintShackAboutPage shows title', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: PrintShackAboutPage()));
      expect(find.textContaining('Print Shack'), findsWidgets);
    });

    testWidgets('PrintShackPersonalisationPage builds', (tester) async {
      await tester
          .pumpWidget(const MaterialApp(home: PrintShackPersonalisationPage()));
      expect(find.byType(PrintShackPersonalisationPage), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisationPage shows personalisation',
        (tester) async {
      await tester
          .pumpWidget(const MaterialApp(home: PrintShackPersonalisationPage()));
      expect(find.textContaining('Personalisation'), findsWidgets);
    });

    testWidgets('PrintShackPersonalisationPage has add to cart button',
        (tester) async {
      await tester
          .pumpWidget(const MaterialApp(home: PrintShackPersonalisationPage()));
      expect(find.text('Add to Cart'), findsOneWidget);
    });
  });
}

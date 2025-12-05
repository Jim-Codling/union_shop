import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/product_page.dart';

void main() {
  group('Product Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(
        home: ProductPage(
          title: 'Logo T-Shirt',
          price: '£18.00',
          imageUrl: 'assets/branded_merch_1.png',
          description:
              'Classic t-shirt with university logo. Comfortable for everyday wear.',
        ),
      );
    }

    testWidgets('should display product page with basic elements',
        (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.text('Branded Merchandise'), findsOneWidget);
      expect(find.text('Logo T-Shirt'), findsOneWidget);
      expect(find.text('£18.00'), findsOneWidget);
      expect(
          find.text(
              'Classic t-shirt with university logo. Comfortable for everyday wear.'),
          findsOneWidget);
    });

    testWidgets('should display student instruction text', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(
          find.text(
              'Students should add size options, colour options, quantity selector, add to cart button, and buy now button here.'),
          findsOneWidget);
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.text('Placeholder Footer'), findsOneWidget);
      expect(find.text('Students should customise this footer section'),
          findsOneWidget);
    });

    testWidgets('should display product image', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.byType(Image), findsWidgets);
    });
  });

  group('Product Model Tests', () {
    test('Product list is not empty', () {
      expect(allProducts.isNotEmpty, true);
    });

    test('Each product has a title', () {
      for (final product in allProducts) {
        expect(product.title.isNotEmpty, true);
      }
    });

    test('Each product has a price', () {
      for (final product in allProducts) {
        expect(product.price.isNotEmpty, true);
      }
    });

    test('Each product has an imageUrl', () {
      for (final product in allProducts) {
        expect(product.imageUrl.isNotEmpty, true);
      }
    });

    test('Each product has a description', () {
      for (final product in allProducts) {
        expect(product.description.isNotEmpty, true);
      }
    });
  });
}

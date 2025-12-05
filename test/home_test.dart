import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/widgets/app_header.dart';
import 'package:union_shop/models/collections.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('Main app builds', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      expect(find.byType(UnionShopApp), findsOneWidget);
    });

    testWidgets('Home page shows Union Shop title', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      expect(find.text('University of Portsmouth Union Shop'), findsOneWidget);
    });

    testWidgets('Home page contains AppHeader', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      expect(find.byType(AppHeader), findsOneWidget);
    });

    testWidgets('Home page has navigation', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      expect(find.byType(Navigator), findsOneWidget);
    });

    testWidgets('Home page shows all collections', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      for (final collection in allCollections) {
        expect(find.text(collection.title), findsWidgets);
      }
    });

    testWidgets('Home page displays featured products', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      for (final product in allProducts.take(4)) {
        expect(find.text(product.title), findsWidgets);
        expect(find.text(product.price), findsWidgets);
      }
    });

    testWidgets('Home page displays header icons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('Home page displays footer', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      expect(find.textContaining('Sale'), findsWidgets);
      expect(find.textContaining('Search'), findsWidgets);
    });
  });
}

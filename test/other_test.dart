import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/about_us_page.dart';
import 'package:union_shop/search_page.dart';
import 'package:union_shop/shopping_bag_page.dart';

void main() {
  group('Other Pages Tests', () {
    testWidgets('AboutUsPage builds', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutUsPage()));
      expect(find.byType(AboutUsPage), findsOneWidget);
    });

    testWidgets('SearchPage builds', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SearchPage()));
      expect(find.byType(SearchPage), findsOneWidget);
    });

    testWidgets('SearchPage shows search box', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SearchPage()));
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('ShoppingBagPage builds', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ShoppingBagPage()));
      expect(find.byType(ShoppingBagPage), findsOneWidget);
    });

    testWidgets('ShoppingBagPage shows shopping bag title', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ShoppingBagPage()));
      expect(find.textContaining('Shopping Bag'), findsWidgets);
    });
  });
}

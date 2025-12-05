import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';

void main() {
  group('AppHeader Widget Tests', () {
    testWidgets('AppHeader displays menu icon', (tester) async {
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      expect(find.byIcon(Icons.menu), findsWidgets);
    });

    testWidgets('AppHeader displays search icon', (tester) async {
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      expect(find.byIcon(Icons.search), findsWidgets);
    });

    testWidgets('AppHeader displays shopping bag icon', (tester) async {
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);
    });

    testWidgets('AppHeader displays logo image', (tester) async {
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('AppHeader displays navigation links', (tester) async {
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      expect(find.byType(IconButton), findsWidgets);
    });
  });
}

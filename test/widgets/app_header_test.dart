import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';

void main() {
  group('AppHeader Widget Tests', () {
    testWidgets('AppHeader builds', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      expect(find.byType(AppHeader), findsOneWidget);
    });

    testWidgets('AppHeader shows logo', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('AppHeader shows navigation links', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      expect(find.byType(IconButton), findsWidgets);
    });

    testWidgets('AppHeader shows search icon', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      expect(find.byIcon(Icons.search), findsWidgets);
    });

    testWidgets('AppHeader shows shopping bag icon', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppHeader())));
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);
    });
  });
}

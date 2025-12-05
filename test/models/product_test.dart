import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('Product Model Tests', () {
    test('All product prices start with £', () {
      for (final product in allProducts) {
        expect(product.price.startsWith('£'), true);
      }
    });

    test('No product has an empty title', () {
      for (final product in allProducts) {
        expect(product.title.trim().isNotEmpty, true);
      }
    });

    test('No product has an empty imageUrl', () {
      for (final product in allProducts) {
        expect(product.imageUrl.trim().isNotEmpty, true);
      }
    });

    test('No product has an empty description', () {
      for (final product in allProducts) {
        expect(product.description.trim().isNotEmpty, true);
      }
    });
  });
}

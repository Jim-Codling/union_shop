import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';

void main() {
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

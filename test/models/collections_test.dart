import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/collections.dart';

void main() {
  group('Collection Model Tests', () {
    test('Collections list contains Sale collection', () {
      expect(allCollections.any((c) => c.title == 'Sale'), true);
    });

    test('No collection has an empty title', () {
      for (final collection in allCollections) {
        expect(collection.title.trim().isNotEmpty, true);
      }
    });

    test('No collection has an empty imageUrl', () {
      for (final collection in allCollections) {
        expect(collection.imageUrl.trim().isNotEmpty, true);
      }
    });

    test('No collection has an empty description', () {
      for (final collection in allCollections) {
        expect(collection.description.trim().isNotEmpty, true);
      }
    });
  });
}

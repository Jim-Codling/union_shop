import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/collections.dart';

void main() {
  group('Collection Model Tests', () {
    test('Collections list is not empty', () {
      expect(allCollections.isNotEmpty, true);
    });

    test('Each collection has a title', () {
      for (final collection in allCollections) {
        expect(collection.title.isNotEmpty, true);
      }
    });

    test('Each collection has an imageUrl', () {
      for (final collection in allCollections) {
        expect(collection.imageUrl.isNotEmpty, true);
      }
    });

    test('Each collection has a description', () {
      for (final collection in allCollections) {
        expect(collection.description.isNotEmpty, true);
      }
    });

    test('All collection titles are unique', () {
      final titles = allCollections.map((c) => c.title).toSet();
      expect(titles.length, allCollections.length);
    });

    test('No collection has a blank imageUrl', () {
      for (final collection in allCollections) {
        expect(collection.imageUrl.trim().isNotEmpty, true);
      }
    });

    test('No collection has a blank description', () {
      for (final collection in allCollections) {
        expect(collection.description.trim().isNotEmpty, true);
      }
    });
  });
}

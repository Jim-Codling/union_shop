class Collection {
  final String title;
  final String imageUrl;
  final String description;

  Collection({
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}

final List<Collection> allCollections = [
  Collection(
    title: 'Branded Merchandise',
    imageUrl: 'assets/branded_merch_1.png',
    description: 'Official university branded clothing and accessories.',
  ),
  Collection(
    title: 'Stationery',
    imageUrl: 'assets/stationary_1.png',
    description: 'Notebooks, pens, planners and more for your studies.',
  ),
  Collection(
    title: 'Local Gifts',
    imageUrl: 'assets/local_gifts_1.png',
    description: 'Unique gifts and souvenirs from local artists and makers.',
  ),
  Collection(
    title: 'Apparel',
    imageUrl: 'assets/apparel_1.png',
    description: 'Casual and comfortable clothing for everyday wear.',
  ),
  Collection(
    title: 'Accessories',
    imageUrl: 'assets/accessories_1.png',
    description: 'Bags, hats, scarves and more to complete your look.',
  ),
  Collection(
    title: 'Home & Living',
    imageUrl: 'assets/home_and_living_1.png',
    description: 'Decor, kitchenware and essentials for your home.',
  ),
];

class Product {
  final String title;
  final String price;
  final String imageUrl;
  final String description;
  final List<String>? colors;
  final List<String>? sizes;
  final bool clothes;

  Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.colors,
    this.sizes,
    this.clothes = false,
  });
}

// All products in the shop
final List<Product> allProducts = [
  // Branded Merchandise
  Product(
    title: 'Logo T-Shirt',
    price: '£18.00',
    imageUrl: 'assets/branded_merch_1.png',
    description:
        'Classic t-shirt with university logo. Comfortable for everyday wear.',
    colors: ['White', 'Black', 'Navy'],
    sizes: ['S', 'M', 'L', 'XL'],
    clothes: true,
  ),
  Product(
    title: 'Campus Hoodie',
    price: '£35.00',
    imageUrl: 'assets/branded_merch_2.png',
    description:
        'Warm and cozy hoodie with campus branding. Perfect for chilly days.',
    colors: ['Grey', 'Black'],
    sizes: ['S', 'M', 'L', 'XL'],
    clothes: true,
  ),
  Product(
    title: 'Branded Cap',
    price: '£15.00',
    imageUrl: 'assets/branded_merch_3.png',
    description:
        'Stylish cap featuring the university logo. Great for sunny days.',
    clothes: true,
  ),
  // Stationery
  Product(
    title: 'Premium Notebook',
    price: '£8.50',
    imageUrl: 'assets/stationary_2.png',
    description: 'High-quality notebook for notes and ideas.',
    clothes: false,
  ),
  Product(
    title: 'Set of Pens',
    price: '£6.00',
    imageUrl: 'assets/stationary_3.png',
    description: 'Smooth-writing pens in assorted colors.',
    clothes: false,
  ),
  Product(
    title: 'Academic Planner',
    price: '£12.00',
    imageUrl: 'assets/stationary_4.png',
    description: 'Organize your schedule with this academic planner.',
    clothes: false,
  ),
  // Local Gifts
  Product(
    title: 'Local Ceramic Mug',
    price: '£9.00',
    imageUrl: 'assets/local_gifts_2.png',
    description: 'Ceramic mug featuring local artwork.',
    clothes: false,
  ),
  Product(
    title: 'City Postcard Set',
    price: '£5.50',
    imageUrl: 'assets/local_gifts_3.png',
    description: 'Set of postcards showcasing city landmarks.',
    clothes: false,
  ),
  Product(
    title: 'Local Art Print',
    price: '£14.00',
    imageUrl: 'assets/local_gifts_4.png',
    description: 'Beautiful print by a local artist.',
    clothes: false,
  ),
  // Apparel
  Product(
    title: 'Cotton T-Shirt',
    price: '£16.00',
    imageUrl: 'assets/apparel_1.png',
    description: 'Soft cotton t-shirt for everyday comfort.',
    colors: ['White', 'Black', 'Navy'],
    sizes: ['S', 'M', 'L', 'XL'],
    clothes: true,
  ),
  Product(
    title: 'Joggers',
    price: '£28.00',
    imageUrl: 'assets/apparel_2.png',
    description: 'Relaxed fit joggers for casual wear.',
    colors: ['Black', 'Grey'],
    sizes: ['S', 'M', 'L', 'XL'],
    clothes: true,
  ),
  Product(
    title: 'Crew Neck Sweatshirt',
    price: '£32.00',
    imageUrl: 'assets/apparel_3.png',
    description: 'Classic crew neck sweatshirt with soft lining.',
    colors: ['Blue', 'Grey'],
    sizes: ['S', 'M', 'L', 'XL'],
    clothes: true,
  ),
  // Accessories
  Product(
    title: 'Canvas Backpack',
    price: '£42.00',
    imageUrl: 'assets/accessories_2.png',
    description: 'Durable canvas backpack for books and essentials.',
    clothes: false,
  ),
  Product(
    title: 'Wool Scarf',
    price: '£18.00',
    imageUrl: 'assets/accessories_3.png',
    description: 'Warm wool scarf for chilly weather.',
    clothes: false,
  ),
  Product(
    title: 'Phone Case',
    price: '£12.00',
    imageUrl: 'assets/accessories_4.png',
    description: 'Protective phone case with stylish design.',
    clothes: false,
  ),
  // Home & Living
  Product(
    title: 'Throw Pillow',
    price: '£22.00',
    imageUrl: 'assets/home_and_living_2.png',
    description: 'Soft throw pillow for your sofa or bed.',
    clothes: false,
  ),
  Product(
    title: 'Desk Lamp',
    price: '£35.00',
    imageUrl: 'assets/home_and_living_3.png',
    description: 'Modern desk lamp for your workspace.',
    clothes: false,
  ),
  Product(
    title: 'Bed Throw',
    price: '£40.00',
    imageUrl: 'assets/home_and_living_4.png',
    description: 'Cozy bed throw for extra warmth.',
    clothes: false,
  ),
  Product(
    title: 'Custom Print Shack Hoodie',
    price: '£40.00',
    imageUrl: 'assets/apparel_4.png',
    description:
        'Personalise your hoodie with up to 4 lines of custom text. Choose your colour and size!',
    colors: ['Black', 'Grey', 'Navy', 'White'],
    sizes: ['S', 'M', 'L', 'XL'],
    clothes: true,
  ),
];

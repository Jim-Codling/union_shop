# Union Shop

A Flutter application for the University of Portsmouth Union Shop.  
This app allows users to browse, search, and purchase official university merchandise, stationery, gifts, apparel, and more.

---

## Features

- Browse collections of university-branded products and local gifts
- View detailed product pages with images, descriptions, and pricing
- Add products to a shopping cart and manage quantities
- Personalise clothing with custom text via the Print Shack
- Search for products by name
- Responsive design for both desktop and mobile
- User authentication (login page)
- Shopping bag/cart management

---

## Installation & Setup

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Compatible OS: Windows, macOS, or Linux
- [Git](https://git-scm.com/downloads) for cloning the repository

### Clone the Repository

```bash
git clone <your-repo-url>
cd union_shop

### Install Dependencies

flutter pub get

###Run the App

###To run on your default device (web, desktop, or mobile):

flutter run

###To run on a specific platform (e.g., Windows):

flutter run -d windows


###Usage
-Browse Collections: Navigate through categories like Branded Merchandise, Stationery, Apparel, and Sale.
-View Products: Click on any product to see its details, available sizes/colors, and add it to your cart.
-Search: Use the search feature to quickly find products by name.
-Personalisation: Visit the Print Shack section to personalise clothing with custom text.
-Shopping Cart: Access your shopping bag to review, update, or remove items before checkout.
-Login: Use the login page to access user-specific features (if implemented).

###The project is organized into several main directories and files:

lib/: This is the main source folder for the Flutter app.
main.dart: The entry point of the app, where routes and the main app widget are defined.
models/: Contains data model classes such as Product and Collection that define the structure of your data.
widgets/: Contains reusable UI components like AppHeader and other custom widgets used throughout the app.
product_page.dart, collection_detail_page.dart, sale_page.dart, print_shack_about_page.dart, print_shack_personalisation_page.dart, search_page.dart: These are the main feature pages of the app, each handling a specific section or functionality (e.g., product details, collections, sales, personalisation, search).
assets/: This folder contains images and other static resources used in the app, such as product and collection images.
pubspec.yaml: The configuration file where dependencies and assets are declared.
This structure separates data models, UI components, and feature pages, making the codebase organized and maintainable.

###Contribution
Contributions are welcome! Please fork the repository and submit a pull request.
For major changes, open an issue first to discuss your ideas.

###Contact
Maintainer:
Jim Codling
jcodling43@gmail.com
https://github.com/Jim-Codling
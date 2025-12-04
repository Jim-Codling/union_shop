import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),

            // About Us Hero
            Container(
              height: 400,
              color: Colors.white,
              child: Column(
                children: [
                  const Text(
                    'About Us',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Welcome to the Union Shop! We are dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! All online purchases are available for delivery or instore collection! \n \n We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net.\n \n Happy shopping! The Union Shop & Reception Team​​​​​​​​​​',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 71, 71, 71)),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => navigateToHome(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4d2963),
                    ),
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false),
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
      ),
    );
  }
}

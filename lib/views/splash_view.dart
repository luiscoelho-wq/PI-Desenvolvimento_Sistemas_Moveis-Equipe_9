import 'package:flutter/material.dart';
import 'login_view.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF6A1B9A).withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.account_balance,
                size: 70,
                color: Color(0xFF6A1B9A),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Atlas Contábil",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A1B9A),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Organização inteligente para seu negócio",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to simulate splash screen duration
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the main screen after splash screen duration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(39, 39, 54, 1),
        width: 400,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.wechat,
              color: Color.fromRGBO(110, 228, 104, 1),
              size: 70,
            ),
            Text(
              "MyChat",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import '../../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff152C3E),
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Image(
              image: NetworkImage(
                "https://i.pinimg.com/originals/e1/70/03/e17003d3a86823bea8a48e4ec03d33e9.gif",
              ),
            ),
          ),
          Spacer(),
          LinearProgressIndicator(),
        ],
      ),
    );
  }
}

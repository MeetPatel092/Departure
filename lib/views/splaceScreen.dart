import 'dart:async';

import 'package:flutter/material.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/logo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Black shadow overlay
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          // Centered text
          Container(
            alignment: Alignment(0.2, 0.35),
            child: Text(
              'श्रीमद् भगवद्गीता',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

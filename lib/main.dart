import 'package:bhagavad_gita/views/detailPage.dart';
import 'package:bhagavad_gita/views/homePage.dart';
import 'package:bhagavad_gita/views/like_page.dart';
import 'package:bhagavad_gita/views/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_page',
      routes: {
        "/": (context) => const HomePage(),
        "splash_page": (context) => const SplashPage(),
        "detailpage": (context) => const DetailPage(),
        "like_page": (context) => const LikedShlokasPage(),
      },
    ),
  );
}

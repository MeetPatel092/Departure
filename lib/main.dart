import 'package:bhagavad_gita/views/detailPage.dart';
import 'package:bhagavad_gita/views/homePage.dart';
import 'package:bhagavad_gita/views/splaceScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splacepage',
      routes: {
        "/": (context) => HomePage(),
        "splacepage": (context) => SplaceScreen(),
        "detailpage": (context) => DetailPage(),
      },
    ),
  );
}

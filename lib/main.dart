import 'package:flutter/material.dart';
import 'package:test2/views/screens/coupon_page.dart';
import 'package:test2/views/screens/home_page.dart';
import 'package:test2/views/screens/splash_screens.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: 'splash_screens',
      routes: {
        '/': (context) => const home_page(),
        'splash_screens': (context) => const splash_screens(),
        'coupon_page': (context) => const coupon_page(),
      },
    ),
  );
}

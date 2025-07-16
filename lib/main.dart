import 'package:clinicfinderkenya/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:clinicfinderkenya/splashscreen .dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => Splash(),
        '/dashboard':(context) => Dashboard(),
      },
    ),
  );
}

import 'package:clinicfinderkenya/screens/clinics.dart';
import 'package:clinicfinderkenya/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:clinicfinderkenya/screens/splashscreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClinicCategoriesPage(),
      routes: {
        '/splash': (context) => Splash(),
        '/dashboard': (context) => DashboardScreen(),
      },
    ),
  );
}

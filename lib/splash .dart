import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[300],
        ),
        child: Text( 
          "Welcome to ClinicFinderKenya"
        ),
      ),      
    );
  }
}

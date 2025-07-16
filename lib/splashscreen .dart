import 'package:clinicfinderkenya/dashboard.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context)=> Dashboard(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.blue[300]),
        child: Text(
          "Welcome to ClinicFinderKenya",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
    );
  }
}

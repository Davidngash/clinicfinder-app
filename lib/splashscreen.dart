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
    // _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 10500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.30,
          width: MediaQuery.of(context).size.width * 0.55,
          child: Column(
            children: [
              Image(
                image: AssetImage(
                  'lib/images/logo1.png',
                  // height: MediaQuery.of(context).size.height * 0.25,
                  // fit: BoxFit.fill,
                ),
              ),
              Text(
                "Welcome to Clinicfinderkenya  ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

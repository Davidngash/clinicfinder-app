import 'package:flutter/material.dart';
import 'package:clinicfinderkenya/splash .dart';
void main (){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        '/splash':(context) => Splash()
      }
    )
  );
}
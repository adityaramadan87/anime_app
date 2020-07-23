import 'dart:async';

import 'package:anime_app/constant/Constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    
    start();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(),
    );
  }

  start() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, _navPage);
  }

  void _navPage() {
    Navigator.pushReplacementNamed(context, Constant.HOME);
  }
}


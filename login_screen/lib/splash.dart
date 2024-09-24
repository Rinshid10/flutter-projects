import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_screen/homeScreen.dart';
import 'package:login_screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      cheackUser(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                // Background color
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(100), // Adjust the radius as needed
              ),
              child: Icon(
                Icons.person,
                size: 80,
              )),
        ]),
      ),
    );
  }

  Future<void> cheackUser(BuildContext context) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    final shared = _sharedprefs.getBool('username');
    if (shared == null || shared == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => LoginScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
    }
  }
}

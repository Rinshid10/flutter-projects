import 'package:flutter/material.dart';
import 'package:login_screen/homeScreen.dart';

import 'package:login_screen/splash.dart';

void main() {
  runApp(MyApp());
}

const islogin = 'rinshid';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

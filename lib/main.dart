import 'package:flutter/material.dart';
import 'package:okonect/ui/home/MainScreen.dart';
import 'package:okonect/ui/home/homeScreen.dart';
import 'package:okonect/ui/introScreen/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OKONECT SHARE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

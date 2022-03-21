import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:okonect/providers/statics.dart';
import 'package:okonect/ui/home/MainScreen.dart';
import 'package:okonect/ui/home/homeScreen.dart';
import 'package:okonect/ui/introScreen/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: MyStatics.debug);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OKONECT SHARE',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

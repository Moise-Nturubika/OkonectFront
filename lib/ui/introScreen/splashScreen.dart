import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:okonect/ui/home/MainScreen.dart';
import 'package:okonect/ui/login/loginPage.dart';
import 'package:okonect/ui/widgets/delayed_animation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future loading() async {
    await new Future.delayed(new Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => LoginScreen()), (route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: DelayedAnimation(
                  delay: 100,
                  child: Column(
                    children: [
                      Container(
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/images/logo.png')),
                      // Text("Action",
                      //     style: GoogleFonts.lobster(
                      //       textStyle: TextStyle(
                      //           fontSize: 35,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.blue[900]),
                      //     )),
                    ],
                  ))),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 30),
        height: 50,
        width: 50,
        child: SpinKitSpinningLines(
          size: 40,
          color: Color.fromARGB(255, 240, 144, 0),
        ),
      ),
    );
  }
}

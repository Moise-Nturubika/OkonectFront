import 'package:flutter/material.dart';
import 'package:okonect/ui/widgets/delayed_animation.dart';
import 'package:okonect/ui/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [Colors.deepOrange, Colors.white])),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DelayedAnimation(
                  delay: 100,
                  child: Column(
                    children: [
                      Container(
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/images/logo.png')),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              textField(textHint: "Nom d'utilisateur")
            ],
          ),
        ),
      ),
    );
  }
}

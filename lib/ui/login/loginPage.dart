import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
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
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [Colors.deepOrange, Colors.white])),
        child: Container(
          padding: EdgeInsets.all(20),
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
              cardTextField(
                  hintText: "Numero de telephone",
                  icon: LineIcons.phone,
                  textInputType: TextInputType.number),
              SizedBox(
                height: 15,
              ),
              cardTextField(
                  hintText: "Mot de passe",
                  icon: LineIcons.key,
                  textInputType: TextInputType.text,
                  isObscur: true),
              // text(textHint: "Nom d'utilisateur")
            ],
          ),
        ),
      ),
    );
  }
}

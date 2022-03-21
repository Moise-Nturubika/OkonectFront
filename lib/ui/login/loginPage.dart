import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:okonect/ui/home/MainScreen.dart';
import 'package:okonect/ui/login/new_account.dart';
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
                colors: [
              Colors.deepOrange,
              Color.fromARGB(179, 242, 232, 232)
            ])),
        child: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
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
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.all(12.0),
                  shape: StadiumBorder(),
                  child: Text(
                    "CONNEXION",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.deepOrange,
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (ctx) => MainPage()),
                        (route) => false);
                  },
                ),
              ),
              FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  alignment: Alignment.center,
                  child: Text(
                    "CREER UN COMPTE",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => AccountScreen()));
                },
              )
              // text(textHint: "Nom d'utilisateur")
            ],
          ),
        ),
      ),
    );
  }
}

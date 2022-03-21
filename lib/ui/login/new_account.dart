import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:okonect/ui/widgets/widgets.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("CREATION DU COMPTE", style: TextStyle(fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15, top: 30),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      child: CircleAvatar(
                        child: Icon(LineIcons.user),
                        backgroundColor: Colors.white,
                        radius: 60,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 162, 161, 161)),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 90,
                    child: FloatingActionButton(
                      mini: true,
                      onPressed: () {},
                      child: Icon(LineIcons.camera),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            cardTextField(
                hintText: "Nom complet",
                icon: LineIcons.user,
                textInputType: TextInputType.text),
            SizedBox(
              height: 15,
            ),
            cardTextField(
                hintText: "Numero de telephone",
                icon: LineIcons.phone,
                textInputType: TextInputType.text),
            SizedBox(
              height: 15,
            ),
            cardTextField(
                hintText: "Mot de passe",
                icon: LineIcons.lock,
                textInputType: TextInputType.text),
            SizedBox(
              height: 15,
            ),
            cardTextField(
                hintText: "Confirmation du mot de passe",
                icon: LineIcons.lock,
                textInputType: TextInputType.text),
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
                  "ENREGISTRER",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepOrange,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
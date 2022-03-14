import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:okonect/ui/profil/videos/videoUser.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 0.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.8,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: ClipPath(
                      clipper: CustomShapeDetail(),
                      child: Container(
                        padding: EdgeInsets.only(top: 300),
                        height: MediaQuery.of(context).size.height / 1.1,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 1,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          LineIcons.userEdit,
                                          color: Colors.deepOrange,
                                          size: 30,
                                        ),
                                        Text("Profil")
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 1,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) => VideoUser()));
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            LineIcons.video,
                                            color: Colors.deepOrange,
                                            size: 30,
                                          ),
                                          Text("Vidéos")
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 1,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          LineIcons.download,
                                          color: Colors.deepOrange,
                                          size: 30,
                                        ),
                                        Text("Download")
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              elevation: 1,
                              child: Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Icon(
                                        LineIcons.user,
                                        // color: Colors.deepOrange,
                                      ),
                                      title: Text("Nom de l'utilisateur"),
                                      subtitle: Text("Moïse Nturubika"),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        LineIcons.phone,
                                        // color: Colors.deepOrange,
                                      ),
                                      title: Text("Numero de téléphone"),
                                      subtitle: Text("+243 975 236 270"),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 110,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage('assets/images/profil.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShapeDetail extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // print("Width =============> ${size.width}");
    // print("Heigth ============> ${size.height}");
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 280);
    //path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    // path.quadraticBezierTo(size.width / 2, 200, size.width, 280.0 - 200);
    // path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

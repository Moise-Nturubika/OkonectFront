import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
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
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 110,
              left: 110,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.black,
              ),
            )
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
    path.lineTo(0, 250);
    //path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    // path.quadraticBezierTo(size.width / 2, 200, size.width, 280.0 - 200);
    // path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

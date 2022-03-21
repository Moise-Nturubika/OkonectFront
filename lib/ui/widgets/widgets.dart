import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shimmer/shimmer.dart';

Widget cardCategory(
    {required IconData icon,
    required String category,
    required var onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: EdgeInsets.only(right: 10),
      child: Card(
        elevation: 1,
        child: Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            height: 50,
            width: 100,
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.deepOrange,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("$category")
              ],
            )),
      ),
    ),
  );
}

Widget cardShimmerCategory() {
  return Container(
    padding: EdgeInsets.only(right: 10),
    child: Card(
      elevation: 1,
      child: Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 231, 230, 230),
        highlightColor: Color.fromARGB(255, 245, 244, 244),
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8),
          height: 50,
          width: 100,
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget cardRecentlyAdd() {
  return Container(
    child: Row(
      children: [
        Card(
          child: Container(
            height: 60,
            width: 60,
            color: Colors.deepOrange,
          ),
        ),
        SizedBox(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Spider Man: No far from home"),
            Text(
              "Film",
              style: TextStyle(fontWeight: FontWeight.w100),
            )
          ],
        )
      ],
    ),
  );
}

Widget textField(
    {String? textHint,
    TextEditingController? controller,
    bool? enabled,
    bool? isNumber}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text("$textHint"),
      ),
      Container(
        height: 50.0,
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border:
              Border.all(color: Color.fromARGB(255, 212, 212, 212), width: 0.4),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: TextFormField(
              keyboardType:
                  isNumber == null ? TextInputType.text : TextInputType.number,
              enabled: enabled == null ? true : enabled,
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  LineIcons.search,
                  color: Colors.blue[900],
                ),
                border: InputBorder.none,
              )),
        ),
      )
    ],
  );
}

Widget listTileRecentAdd(
    {required String title, required String category, required var onPressed}) {
  return ListTile(
    leading: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.deepOrange)),
      child: Icon(
        category.toLowerCase().contains("film")
            ? LineIcons.film
            : category.toLowerCase().contains("music")
                ? LineIcons.music
                : category.toLowerCase().contains("video")
                    ? LineIcons.video
                    : LineIcons.pdfFile,
        color: Colors.black,
      ),
    ),
    title: Text(
      "$title",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Text("$category"),
    onTap: onPressed,
  );
}

Widget listShimmerRecentAdd() {
  return ListTile(
    leading: Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 231, 230, 230),
      highlightColor: Color.fromARGB(255, 245, 244, 244),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.deepOrange)),
      ),
    ),
    title: Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 231, 230, 230),
      highlightColor: Color.fromARGB(255, 245, 244, 244),
      child: Container(
        height: 15,
        width: 100,
        color: Colors.white,
      ),
    ),
    subtitle: Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 231, 230, 230),
      highlightColor: Color.fromARGB(255, 245, 244, 244),
      child: Container(
        height: 12,
        color: Colors.white,
      ),
    ),
  );
}

showToast({String? msg}) {
  return Fluttertoast.showToast(msg: "$msg");
}

class CustomTextField extends StatelessWidget {
  final hintText;
  final VoidCallback? onPressed;
  final controler;
  final margeText;
  final textInputType;
  final readOnly;
  final title;
  final focusrequest;
  final isobscure;
  final child;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.onPressed,
    this.controler,
    this.margeText = 1,
    this.textInputType,
    this.readOnly = false,
    this.title,
    this.focusrequest,
    this.isobscure = false,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.dmSans(color: Colors.black),
            ),
            child == null
                ? Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.grey[50],
                      border: Border.all(
                        color: Color.fromARGB(255, 196, 195, 195),
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      obscureText: isobscure,
                      focusNode: focusrequest,
                      readOnly: readOnly,
                      keyboardType: textInputType,
                      maxLines: !isobscure ? margeText : 1,
                      controller: controler,
                      onChanged: (value) {},
                      style: GoogleFonts.dmSans(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: hintText,
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 216, 214, 214)),
                          prefixIcon: Icon(LineIcons.edit)),
                      onTap: onPressed,
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.grey[50],
                      border: Border.all(
                        color: Color.fromARGB(255, 196, 195, 195),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(LineIcons.edit, color: Colors.grey),
                        child
                      ],
                    )),
          ],
        ),
      ),
    );
  }
}

Widget button({String? label, var onPressed}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
    width: double.infinity,
    child: RaisedButton(
      padding: EdgeInsets.all(12.0),
      // shape: StadiumBorder(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$label",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      color: Colors.deepOrange,
      onPressed: onPressed,
    ),
  );
}

Widget alertDialog(
    {required BuildContext context,
    required IconData icon,
    required String msg,
    required Color color}) {
  return Center(
      child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
        // successTicket(ctx,isExpediteur,clientToSearch,txt)
        Container(
            width: double.infinity,
            height: 250,
            padding: const EdgeInsets.all(20.0),
            child: Material(
                clipBehavior: Clip.antiAlias,
                elevation: 2.0,
                borderRadius: BorderRadius.circular(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      icon,
                      color: color,
                      size: 45,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "$msg",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                    ),
                    SizedBox(height: 15),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "OK",
                          style: TextStyle(fontSize: 18),
                        ))
                  ],
                )))
      ])));
}

Widget cardTextField(
    {required String hintText,
    required IconData icon,
    bool isObscur = false,
    bool isReadOnly = false,
    required TextInputType textInputType}) {
  return Card(
    elevation: 3.0,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: TextField(
        keyboardType: textInputType,
        obscureText: isObscur,
        readOnly: isReadOnly,
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          hintStyle: TextStyle(
            fontSize: 15.0,
            color: Colors.grey,
          ),
        ),
        maxLines: 1,
        // controller: _usernameControl,
      ),
    ),
  );
}

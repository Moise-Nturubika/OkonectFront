import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

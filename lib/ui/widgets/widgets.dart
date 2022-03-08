import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';

Widget cardCategory({required IconData icon, required String category}) {
  return GestureDetector(
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
                  color: Colors.orange,
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

Widget cardRecentlyAdd() {
  return Container(
    child: Row(
      children: [
        Card(
          child: Container(
            height: 60,
            width: 60,
            color: Colors.orange,
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
          border: Border.all(color: Colors.grey, width: 1),
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

showToast({String? msg}) {
  return Fluttertoast.showToast(msg: "$msg");
}

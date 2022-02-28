import 'package:flutter/material.dart';
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

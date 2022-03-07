import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

Widget cardVideo(
    {required String title,
    required String category,
    required String image,
    required var onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: onPressed,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('$image')),
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black, Colors.transparent]),
        ),
        child: Stack(
          children: [
            Positioned(
                top: 80,
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                  height: 60,
                  width: 100,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black26, Colors.black]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "$title",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            LineIcons.chevronCircleRight,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "$category",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    ),
  );
}

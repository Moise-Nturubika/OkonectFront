import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:okonect/models/category/category.dart';
import 'package:okonect/models/media/media.dart';
import 'package:okonect/ui/widgets/video_widget.dart';
import 'package:okonect/ui/widgets/widgets.dart';

class CategoryMedia extends StatefulWidget {
  final Category category;
  const CategoryMedia({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryMedia> createState() => _CategoryMediaState();
}

class _CategoryMediaState extends State<CategoryMedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  color: Colors.deepOrange,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          LineIcons.music,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Film",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).size.height * 0.25 -
                        50,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              cardCategorizedMedia(
                                  title: "Exemple", category: "Video"),
                              cardCategorizedMedia(
                                  title: "Exemple", category: "Video"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              cardCategorizedMedia(
                                  title: "Exemple", category: "Video"),
                              cardCategorizedMedia(
                                  title: "Exemple", category: "Video"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              cardCategorizedMedia(
                                  title: "Exemple", category: "Video"),
                              cardCategorizedMedia(
                                  title: "Exemple", category: "Video"),
                            ],
                          ),
                        ],
                      ),
                    )
                    // GridView.count(
                    //   crossAxisCount: 2,
                    //   children: [
                    //     cardCategorizedMedia(title: "Exemple", category: "Video"),
                    //     cardCategorizedMedia(title: "Exemple", category: "Video"),
                    //     cardCategorizedMedia(title: "Exemple", category: "Video"),
                    //     cardCategorizedMedia(title: "Exemple", category: "Video"),
                    //     cardCategorizedMedia(title: "Exemple", category: "Video"),
                    //     cardCategorizedMedia(title: "Exemple", category: "Video"),
                    //     cardCategorizedMedia(title: "Exemple", category: "Video"),
                    //     cardCategorizedMedia(title: "Exemple", category: "Video"),
                    //     cardCategorizedMedia(title: "Exemple", category: "Video"),
                    //     cardCategorizedMedia(title: "Exemple", category: "Video"),
                    //     cardCategorizedMedia(title: "Exemple", category: "Video"),
                    //     cardCategorizedMedia(title: "Exemple", category: "Video"),
                    //     cardCategorizedMedia(title: "Exemple", category: "Video"),
                    //   ],
                    // ),
                    )
              ],
            ),
            Positioned(
              top: 120,
              left: 15,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                padding: EdgeInsets.only(left: 15, right: 15),
                child: textField(textHint: ""),
              ),
            )
          ],
        ),
      ),
    );
  }
}

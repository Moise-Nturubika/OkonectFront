import 'package:flutter/material.dart';
import 'package:okonect/ui/widgets/video_widget.dart';
import 'package:okonect/ui/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + 10,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Que voulez-vous rechercher ?",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: textField(textHint: "", controller: null),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Film",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 180,
                    width: double.infinity,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: List.generate(4, (index) => cardShimmerVideo()),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Video",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 180,
                    width: double.infinity,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: List.generate(4, (index) => cardShimmerVideo()),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Audio",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 180,
                    width: double.infinity,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: List.generate(4, (index) => cardShimmerVideo()),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}

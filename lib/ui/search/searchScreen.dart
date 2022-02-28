import 'package:flutter/material.dart';
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
            padding: EdgeInsets.all(5),
          ),
        ]),
      ),
    ));
  }
}

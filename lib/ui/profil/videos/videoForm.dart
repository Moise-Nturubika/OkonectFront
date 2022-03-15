import 'package:flutter/material.dart';
import 'package:okonect/ui/widgets/widgets.dart';

class VideoForm extends StatefulWidget {
  const VideoForm({Key? key}) : super(key: key);

  @override
  State<VideoForm> createState() => _VideoFormState();
}

class _VideoFormState extends State<VideoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Ajouter un média"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextField(
              hintText: "Entrer le titre du media",
              title: "Titire",
            )
          ],
        ),
      ),
    );
  }
}

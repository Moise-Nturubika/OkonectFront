import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:okonect/ui/widgets/widgets.dart';

class VideoForm extends StatefulWidget {
  const VideoForm({Key? key}) : super(key: key);

  @override
  State<VideoForm> createState() => _VideoFormState();
}

class _VideoFormState extends State<VideoForm> {
  var _image;
  var imagePicker;
  String? categorieSelected;
  List<DropdownMenuItem<String>> dropDownItems = [];

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
    dropDownItems.add(DropdownMenuItem(
      child: Text("Film"),
      value: "1",
    ));
    dropDownItems.add(DropdownMenuItem(
      child: Text("Music"),
      value: "2",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Ajouter un média"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextField(
              hintText: "Entrer le titre du media",
              title: "Titre",
              margeText: 1,
            ),
            CustomTextField(
              hintText: "Entrer l'auteur du media",
              title: "Auteur",
              margeText: 1,
            ),
            CustomTextField(
                hintText: "Selectionner la categorie",
                title: "Categorie",
                child: Container(
                  // height: 80,
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: DropdownButton(
                      value: categorieSelected,
                      underline: Container(
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        // print(value);
                        // categorieSelected = value;
                        // setState(() {});
                      },
                      isExpanded: true,
                      items: dropDownItems),
                )),
            CustomTextField(
              hintText: "Selectionner l'affiche du media",
              title: "Poster",
              margeText: 1,
              readOnly: true,
              onPressed: () async {
                var source = ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source: source,
                    imageQuality: 50,
                    preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image.path);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:okonect/ui/widgets/video_widget.dart';

class VideoUser extends StatefulWidget {
  const VideoUser({Key? key}) : super(key: key);

  @override
  State<VideoUser> createState() => _VideoUserState();
}

class _VideoUserState extends State<VideoUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Mes médias"),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.deepOrange,
          child: Icon(LineIcons.photoVideo)),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            tileVideoUser(),
            tileVideoUser(),
            tileVideoUser(),
            tileVideoUser(),
          ],
        ),
      ),
    );
  }
}

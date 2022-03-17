import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:okonect/bloc/bloc_event.dart';
import 'package:okonect/bloc/block_state.dart';
import 'package:okonect/bloc/user/user_bloc.dart';
import 'package:okonect/ui/profil/videos/videoForm.dart';
import 'package:okonect/ui/widgets/video_widget.dart';

class VideoUser extends StatefulWidget {
  const VideoUser({Key? key}) : super(key: key);

  @override
  State<VideoUser> createState() => _VideoUserState();
}

class _VideoUserState extends State<VideoUser> {
  late UserBloc _bloc;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    _bloc = new UserBloc();
    _bloc.add(BlocEventMediaFetch(data: "1"));
  }

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
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => VideoForm()));
          },
          backgroundColor: Colors.deepOrange,
          child: Icon(LineIcons.photoVideo)),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: BlocBuilder<UserBloc, BlocState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is BlocStateUninitialized || state is BlocStateLoading) {
              return Container(
                // height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(left: 8, right: 8),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(6, (index) => tileVideoShimmer()),
                  ),
                ),
              );
            }
            if (state is BlocStateError) {
              return Center(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      AvatarGlow(
                        glowColor: Color.fromARGB(255, 255, 175, 55),
                        endRadius: 50.0,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 100),
                        child: Icon(LineIcons.wifi,
                            color: Colors.deepOrange, size: 50),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "No internet access",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              );
            }
            if (state is BlocStateLoaded) {
              return Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(state.data.length,
                        (index) => tileVideoUser(media: state.data[index])),
                  ),
                ),
              );
            }
            return Container();
          },
          // child: Column(
          //   children: [
          //     tileVideoUser(),
          //     tileVideoUser(),
          //     tileVideoUser(),
          //     tileVideoUser(),
          //   ],
          // ),
        ),
      ),
    );
  }
}

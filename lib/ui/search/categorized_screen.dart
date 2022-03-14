import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:okonect/bloc/bloc_event.dart';
import 'package:okonect/bloc/block_state.dart';
import 'package:okonect/bloc/media/media_bloc.dart';
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
  late MediaBloc _bloc;
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    _bloc = new MediaBloc();
    _bloc.add(
        BlocEventSameCategoryFetch(category: widget.category.id.toString()));
  }

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
                    padding: EdgeInsets.only(top: 40),
                    child: SingleChildScrollView(
                        child: BlocBuilder<MediaBloc, BlocState>(
                      bloc: _bloc,
                      builder: (context, state) {
                        if (state is BlocStateUninitialized ||
                            state is BlocStateLoading) {
                          return Container(
                            height: MediaQuery.of(context).size.height / 2,
                            child: Column(
                              children: List.generate(
                                  2,
                                  (index) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          cardShimmerCategoryMedia(),
                                          cardShimmerCategoryMedia()
                                        ],
                                      )),
                            ),
                          );
                        }
                        if (state is BlocStateError) {
                          return Center(
                            child: Container(
                              child: Column(
                                children: [
                                  AvatarGlow(
                                    glowColor: Colors.blue,
                                    endRadius: 50.0,
                                    duration: Duration(milliseconds: 2000),
                                    repeat: true,
                                    showTwoGlows: true,
                                    repeatPauseDuration:
                                        Duration(milliseconds: 100),
                                    child: Icon(LineIcons.wifi),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("No internet access")
                                ],
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    )
                        // Column(
                        //   children: [
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //       children: [
                        //         cardCategorizedMedia(
                        //             title: "Exemple", category: "Video"),
                        //         cardCategorizedMedia(
                        //             title: "Exemple", category: "Video"),
                        //       ],
                        //     ),
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //       children: [
                        //         cardCategorizedMedia(
                        //             title: "Exemple", category: "Video"),
                        //         cardCategorizedMedia(
                        //             title: "Exemple", category: "Video"),
                        //       ],
                        //     ),
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //       children: [
                        //         cardCategorizedMedia(
                        //             title: "Exemple", category: "Video"),
                        //         cardCategorizedMedia(
                        //             title: "Exemple", category: "Video"),
                        //       ],
                        //     ),
                        //   ],
                        // ),
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

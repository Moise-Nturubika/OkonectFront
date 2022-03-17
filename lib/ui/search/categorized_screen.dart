import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:okonect/bloc/bloc_event.dart';
import 'package:okonect/bloc/block_state.dart';
import 'package:okonect/bloc/media/media_bloc.dart';
import 'package:okonect/models/category/category.dart';
import 'package:okonect/models/media/media.dart';
import 'package:okonect/ui/media/audio_player.dart';
import 'package:okonect/ui/media/video_player.dart';
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
                          widget.category.designation
                                  .toString()
                                  .toLowerCase()
                                  .contains("film")
                              ? LineIcons.film
                              : widget.category.designation
                                      .toString()
                                      .toLowerCase()
                                      .contains("video")
                                  ? LineIcons.video
                                  : widget.category.designation
                                          .toString()
                                          .toLowerCase()
                                          .contains("music")
                                      ? LineIcons.music
                                      : LineIcons.pdfFile,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "${widget.category.designation}",
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
                        physics: BouncingScrollPhysics(),
                        child: BlocBuilder<MediaBloc, BlocState>(
                          bloc: _bloc,
                          builder: (context, state) {
                            if (state is BlocStateUninitialized ||
                                state is BlocStateLoading) {
                              return Container(
                                height: MediaQuery.of(context).size.height - 20,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: List.generate(
                                      3,
                                      (index) => Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
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
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 50),
                                      AvatarGlow(
                                        glowColor:
                                            Color.fromARGB(255, 255, 175, 55),
                                        endRadius: 50.0,
                                        duration: Duration(milliseconds: 2000),
                                        repeat: true,
                                        showTwoGlows: true,
                                        repeatPauseDuration:
                                            Duration(milliseconds: 100),
                                        child: Icon(LineIcons.wifi,
                                            color: Colors.deepOrange, size: 50),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "No internet access",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                            if (state is BlocStateLoaded) {
                              int count = 0;
                              // List<Widget> childrens = [];
                              // while (state.data > count) {
                              //   childrens.add(Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceEvenly,
                              //     children: [
                              //       cardCategorizedMedia(
                              //           title: state.data[count].title,
                              //           category: state
                              //               .data[count].category.designation,
                              //           image: state.data[count].poster,
                              //           onPressed: () {}),
                              //       state.data.length > count
                              //           ? cardCategorizedMedia(
                              //               title: state.data[count + 1].title,
                              //               category: state.data[count + 1]
                              //                   .category.designation,
                              //               image: state.data[count + 1].poster,
                              //               onPressed: () {})
                              //           : Container(),
                              //     ],
                              //   ));
                              //   if (state.data.length > count + 2) {
                              //     count += 2;
                              //   }
                              // }
                              if (state.data.length > 0) {
                                return Container(
                                  child: Column(
                                    children: List.generate(state.data.length,
                                        (index) {
                                      Widget value;
                                      print("=======================");
                                      print(
                                          "index : $index ==========> count: $count");
                                      if (state.data.length > count) {
                                        value = Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            cardCategorizedMedia(
                                                title: state.data[count].title,
                                                category: state.data[count]
                                                    .category.designation,
                                                image: state.data[count].poster,
                                                onPressed: () {
                                                  if (widget
                                                          .category.designation
                                                          .toString()
                                                          .toLowerCase()
                                                          .contains('video') ||
                                                      widget
                                                          .category.designation
                                                          .toString()
                                                          .toLowerCase()
                                                          .contains('film')) {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (ctx) =>
                                                                VideoScreen(
                                                                  media: state
                                                                          .data[
                                                                      count],
                                                                )));
                                                  } else {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (ctx) =>
                                                                AudioScreen(
                                                                  media: state
                                                                          .data[
                                                                      count],
                                                                )));
                                                  }
                                                }),
                                            state.data.length > count + 1
                                                ? cardCategorizedMedia(
                                                    title: state
                                                        .data[count + 1].title,
                                                    category: state
                                                        .data[count + 1]
                                                        .category
                                                        .designation,
                                                    image: state
                                                        .data[count + 1].poster,
                                                    onPressed: () {
                                                      if (widget.category
                                                              .designation
                                                              .toString()
                                                              .toLowerCase()
                                                              .contains(
                                                                  'video') ||
                                                          widget.category
                                                              .designation
                                                              .toString()
                                                              .toLowerCase()
                                                              .contains(
                                                                  'film')) {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (ctx) =>
                                                                    VideoScreen(
                                                                      media: state
                                                                              .data[
                                                                          count +
                                                                              1],
                                                                    )));
                                                      } else {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (ctx) =>
                                                                    AudioScreen(
                                                                      media: state
                                                                              .data[
                                                                          count +
                                                                              1],
                                                                    )));
                                                      }
                                                    })
                                                : Container(
                                                    height: 160,
                                                    width: 130,
                                                  ),
                                          ],
                                        );
                                      } else {
                                        value = Container();
                                      }

                                      if (state.data.length > count + 2) {
                                        count += 2;
                                      }
                                      return value;
                                    }),
                                  ),
                                );
                              } else {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.8,
                                  child: AvatarGlow(
                                    glowColor:
                                        Color.fromARGB(255, 255, 175, 55),
                                    endRadius: 100.0,
                                    duration: Duration(milliseconds: 2000),
                                    repeat: true,
                                    showTwoGlows: true,
                                    repeatPauseDuration:
                                        Duration(milliseconds: 100),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/empty.svg',
                                            height: 100,
                                            width: 100,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Empty data",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
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
            ),
            Positioned(
              top: 20,
              left: 5,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

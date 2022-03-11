import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:okonect/bloc/bloc_event.dart';
import 'package:okonect/bloc/block_state.dart';
import 'package:okonect/bloc/media/media_bloc.dart';
import 'package:okonect/models/category/category.dart';
import 'package:okonect/models/client/client.dart';
import 'package:okonect/models/media/media.dart';
import 'package:okonect/ui/media/video_player.dart';
import 'package:okonect/ui/media/vlc_player.dart';
import 'package:okonect/ui/widgets/audio/audio_player.dart';
import 'package:okonect/ui/widgets/delayed_animation.dart';
import 'package:okonect/ui/widgets/video_widget.dart';
import 'package:okonect/ui/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:avatar_glow/avatar_glow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MediaBloc _bloc;
  late MediaBloc _category;
  late MediaBloc _recent;
  late Media _media;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    _bloc = new MediaBloc();
    _category = new MediaBloc();
    _recent = new MediaBloc();
    _bloc.add(BlocEventMediaFetch());
    _category.add(BlocEventCategoryFetch());
    _recent.add(BlocEventRecentFetch());

    _media = new Media(
      auteur: "Marvel",
      category: new Category(id: 1, designation: "Film"),
      dateAjout: "2021-01-01 00:00:00",
      title: "Underground 6",
      client: new Client(
        fullname: "Moise Nturubika",
        phone: "+243 975 236 270",
      ),
      file:
          "http://192.168.5.29:8000/media/video/Clean_Bandit_-_Rockabye_ft._Sean_Paul__Anne-Marie_Official_Video_-_YouTube_360p.mp4",
      poster: "http://192.168.5.29:8000/media/poster/video/spiderman.jpg",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          // physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    backgroundImage: AssetImage('assets/images/profil.png'),
                    radius: 30,
                    foregroundColor: Colors.red,
                  ),
                  Container(
                    height: 50,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Column(
                    children: [
                      InkWell(
                        child: Stack(
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Colors.grey,
                              size: 30,
                            ),
                            Positioned(
                              left: 12,
                              child: Container(
                                height: 18,
                                width: 18,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              DelayedAnimation(
                  delay: 100,
                  child: Container(
                    // height: 200,
                    width: MediaQuery.of(context).size.width / 1.08,
                    child: CarouselSlider(
                        items: [
                          InkWell(
                            child:
                                Image.asset('assets/images/fast-furious.jpg'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => VideoScreen(
                                        media: _media,
                                      )));
                            },
                          ),
                          InkWell(
                            child: Image.asset('assets/images/neptune.jpg'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => VideoScreen(
                                        media: _media,
                                      )));
                            },
                          ),
                          InkWell(
                            child: Image.asset('assets/images/gijoe.jpg'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => VideoScreen(
                                        media: _media,
                                      )));
                            },
                          ),
                          InkWell(
                            child: Image.asset('assets/images/underground.jpg'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => VideoScreen(
                                        media: _media,
                                      )));
                            },
                          ),
                        ],
                        options: CarouselOptions(
                          height: 180,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        )),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  )),
              SizedBox(
                height: 25,
              ),
              Text(
                "Top videos",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 150,
                  width: double.infinity,
                  child:
                      // ListView(
                      //   scrollDirection: Axis.horizontal,
                      //   children: [
                      //     cardVideo(
                      //         title: '',
                      //         category: 'Série',
                      //         image: 'assets/images/casa.jpg',
                      //         onPressed: () {
                      //           Navigator.of(context).push(MaterialPageRoute(
                      //               builder: (ctx) => VideoScreen()));
                      //         }),
                      //     cardVideo(
                      //         title: 'SPIDER MAN',
                      //         category: 'Film',
                      //         image: 'assets/images/spiderman.jpg',
                      //         onPressed: () {}),
                      //     cardVideo(
                      //         title: 'GAME OF THRONE',
                      //         category: 'Série',
                      //         image: 'assets/images/got.jpg',
                      //         onPressed: () {}),
                      //     cardVideo(
                      //         title: 'ACHOUR',
                      //         category: 'Music',
                      //         image: 'assets/images/achour.jpg',
                      //         onPressed: () {
                      //           Navigator.of(context).push(MaterialPageRoute(
                      //               builder: (ctx) => AudioScreen()));
                      //         }),
                      //     cardVideo(
                      //         title: 'PEAKY BLINDERS',
                      //         category: 'Série',
                      //         image: 'assets/images/peaky.jpg',
                      //         onPressed: () {}),
                      //     cardVideo(
                      //         title: 'SNAKE EYES',
                      //         category: 'Film',
                      //         image: 'assets/images/snakeeyes.jpg',
                      //         onPressed: () {}),
                      //   ],
                      // )
                      BlocBuilder<MediaBloc, BlocState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is BlocStateUninitialized ||
                          state is BlocStateLoading) {
                        return ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children:
                              List.generate(4, (index) => cardShimmerVideo()),
                        );
                      }
                      if (state is BlocStateLoaded) {
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              state.data.length,
                              (index) => cardVideo(
                                  title: state.data[index].title,
                                  category:
                                      state.data[index].category.designation,
                                  image: state.data[index].poster,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (ctx) => VideoScreen(
                                                  media: state.data[index],
                                                )));
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (ctx) => VlcPlayer()));
                                  })),
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
                  )),
              SizedBox(
                height: 25,
              ),
              Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: BlocBuilder<MediaBloc, BlocState>(
                  bloc: _category,
                  builder: (context, state) {
                    if (state is BlocStateUninitialized ||
                        state is BlocStateLoading) {
                      return ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children:
                            List.generate(4, (index) => cardShimmerCategory()),
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
                    if (state is BlocStateLoaded) {
                      return ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            state.data.length,
                            (index) => cardCategory(
                                icon: state.data[index].designation
                                        .toString()
                                        .toLowerCase()
                                        .contains("film")
                                    ? LineIcons.film
                                    : state.data[index].designation
                                            .toString()
                                            .toLowerCase()
                                            .contains("music")
                                        ? LineIcons.music
                                        : state.data[index].designation
                                                .toString()
                                                .toLowerCase()
                                                .contains("video")
                                            ? LineIcons.video
                                            : LineIcons.pdfFile,
                                category: state.data[index].designation),
                          )
                          // [
                          //   cardCategory(icon: LineIcons.film, category: "Film"),
                          //   cardCategory(icon: LineIcons.music, category: "Music"),
                          //   cardCategory(icon: LineIcons.video, category: "Vidéo"),
                          //   cardCategory(icon: LineIcons.pdfFile, category: "Pdf"),
                          // ],
                          );
                    }
                    return Container();
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Recently added",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<MediaBloc, BlocState>(
                bloc: _recent,
                builder: (context, state) {
                  if (state is BlocStateUninitialized ||
                      state is BlocStateLoading) {
                    return Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children:
                            List.generate(4, (index) => cardShimmerCategory()),
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
                              repeatPauseDuration: Duration(milliseconds: 100),
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
                  if (state is BlocStateLoaded) {
                    return Container(
                      height: 200,
                      child: ListView(
                          children: List.generate(
                              state.data.length,
                              (index) => listTileRecentAdd(
                                  title: state.data[index].category.designation
                                              .toString()
                                              .toLowerCase()
                                              .contains('music') ||
                                          state.data[index].category.designation
                                              .toString()
                                              .toLowerCase()
                                              .contains('video')
                                      ? "${state.data[index].auteur} : ${state.data[index].title}"
                                      : state.data[index].title,
                                  category: state
                                      .data[index].category.designation
                                      .toString()))
                          // [
                          //   listTileRecentAdd(
                          //       category: 'Film',
                          //       title: "Spider Man: No far from home"),
                          //   listShimmerRecentAdd(),
                          //   listTileRecentAdd(
                          //       category: 'Music', title: "InnosB : Olandi"),
                          //   listTileRecentAdd(
                          //       category: 'video',
                          //       title: "Fally Ipupa: Canne à sucre"),
                          // ],
                          ),
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

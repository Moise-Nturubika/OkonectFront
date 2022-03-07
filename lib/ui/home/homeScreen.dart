import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:okonect/ui/media/video_player.dart';
import 'package:okonect/ui/widgets/audio/audio_player.dart';
import 'package:okonect/ui/widgets/delayed_animation.dart';
import 'package:okonect/ui/widgets/video_widget.dart';
import 'package:okonect/ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          Image.asset('assets/images/fast-furious.jpg'),
                          Image.asset('assets/images/neptune.jpg'),
                          Image.asset('assets/images/gijoe.jpg'),
                          Image.asset('assets/images/underground.jpg'),
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
                        )))),
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // children: List.generate(5, (index) => cardVideo()),
                  children: [
                    cardVideo(
                        title: 'CASA DE PAPEL',
                        category: 'Série',
                        image: 'assets/images/casa.jpg',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => VideoScreen()));
                        }),
                    cardVideo(
                        title: 'SPIDER MAN',
                        category: 'Film',
                        image: 'assets/images/spiderman.jpg',
                        onPressed: () {}),
                    cardVideo(
                        title: 'GAME OF THRONE',
                        category: 'Série',
                        image: 'assets/images/got.jpg',
                        onPressed: () {}),
                    cardVideo(
                        title: 'ACHOUR',
                        category: 'Music',
                        image: 'assets/images/achour.jpg',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => AudioScreen()));
                        }),
                    cardVideo(
                        title: 'PEAKY BLINDERS',
                        category: 'Série',
                        image: 'assets/images/peaky.jpg',
                        onPressed: () {}),
                    cardVideo(
                        title: 'SNAKE EYES',
                        category: 'Film',
                        image: 'assets/images/snakeeyes.jpg',
                        onPressed: () {}),
                  ],
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  cardCategory(icon: LineIcons.film, category: "Film"),
                  cardCategory(icon: LineIcons.music, category: "Music"),
                  cardCategory(icon: LineIcons.video, category: "Vidéo"),
                  cardCategory(icon: LineIcons.pdfFile, category: "Pdf"),
                ],
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
            Column(
              children: [
                ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange)),
                    child: Icon(
                      LineIcons.film,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    "Spider Man: No far from home",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Film"),
                ),
                ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange)),
                    child: Icon(
                      LineIcons.music,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    "InnosB : Olandi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Music"),
                ),
                ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange)),
                    child: Icon(
                      LineIcons.video,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    "Fally Ipupa: Canne à sucre",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Vidéo"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:okonect/models/media/media.dart';
import 'package:shimmer/shimmer.dart';

Widget cardVideo(
    {required String title, String? category, String? image, var onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: onPressed,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            // image: AssetImage('$image')
            image: image == null || image.isEmpty
                ? AssetImage('assets/images/video.png')
                : CachedNetworkImageProvider(
                    '$image',
                  ) as ImageProvider,
            // CachedNetworkImage(
            //     imageUrl: '$image',
            //     placeholder: (ctx, url) => Shimmer.fromColors(
            //       child: Container(
            //         height: 100,
            //         width: 100,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: Colors.white),
            //       ),
            //       baseColor: Color.fromARGB(255, 231, 230, 230),
            //       highlightColor: Color.fromARGB(255, 245, 244, 244),
            //     ),
            //     errorWidget: (ctx, url, e) => Image(
            //       image: Svg('assets/images/video.svg'),
            //     ),
            //   ) as ImageProvider
          ),
          border: image == null
              ? Border.all(color: Color.fromARGB(255, 207, 205, 205))
              : null,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black, Colors.transparent]),
        ),
        child: Stack(
          children: [
            Positioned(
                top: 80,
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                  height: 60,
                  width: 100,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black26, Colors.black]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        title.length <= 12
                            ? "$title"
                            : "${title.substring(0, 11)}...",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            LineIcons.chevronCircleRight,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "$category",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    ),
  );
}

Widget cardCategorizedMedia(
    {required String title, String? category, String? image, var onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: onPressed,
      child: Container(
        height: 160,
        width: 130,
        decoration: BoxDecoration(
          image: DecorationImage(
            // image: AssetImage('$image')
            image: image == null || image.isEmpty
                ? AssetImage('assets/images/video.png')
                : CachedNetworkImageProvider('$image') as ImageProvider,
            // CachedNetworkImage(
            //     imageUrl: '$image',
            //     placeholder: (ctx, url) => Shimmer.fromColors(
            //       child: Container(
            //         height: 100,
            //         width: 100,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: Colors.white),
            //       ),
            //       baseColor: Color.fromARGB(255, 231, 230, 230),
            //       highlightColor: Color.fromARGB(255, 245, 244, 244),
            //     ),
            //     errorWidget: (ctx, url, e) => Image(
            //       image: Svg('assets/images/video.svg'),
            //     ),
            //   ) as ImageProvider
          ),
          border: image == null
              ? Border.all(color: Color.fromARGB(255, 207, 205, 205))
              : null,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black, Colors.transparent]),
        ),
        child: Stack(
          children: [
            Positioned(
                top: 100,
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                  height: 60,
                  width: 130,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black26, Colors.black]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        title.length <= 12
                            ? "$title"
                            : "${title.substring(0, 11)}...",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            LineIcons.chevronCircleRight,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "$category",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    ),
  );
}

Widget cardShimmerCategoryMedia() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        height: 160,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromARGB(255, 231, 230, 230),
            )
            // gradient: LinearGradient(
            //     begin: Alignment.bottomCenter,
            //     end: Alignment.center,
            //     colors: [Colors.black, Colors.transparent]),
            ),
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 231, 230, 230),
              highlightColor: Color.fromARGB(255, 245, 244, 244),
              child: Container(
                  height: 90,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 231, 230, 230),
              highlightColor: Color.fromARGB(255, 245, 244, 244),
              child: Container(
                width: 120,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 231, 230, 230),
              highlightColor: Color.fromARGB(255, 245, 244, 244),
              child: Container(
                width: 120,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
              ),
            )
          ],
        )),
  );
}

Widget cardShimmerVideo() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromARGB(255, 231, 230, 230),
            )
            // gradient: LinearGradient(
            //     begin: Alignment.bottomCenter,
            //     end: Alignment.center,
            //     colors: [Colors.black, Colors.transparent]),
            ),
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 231, 230, 230),
              highlightColor: Color.fromARGB(255, 245, 244, 244),
              child: Container(
                  height: 90,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  )),
            ),
            SizedBox(
              height: 5,
            ),
            Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 231, 230, 230),
              highlightColor: Color.fromARGB(255, 245, 244, 244),
              child: Container(
                width: 90,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 231, 230, 230),
              highlightColor: Color.fromARGB(255, 245, 244, 244),
              child: Container(
                width: 90,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
              ),
            )
          ],
        )),
  );
}

Widget tileVideoUser({required Media media}) {
  return Padding(
    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
    child: Card(
      child: Container(
        height: 100,
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 60,
                  decoration: BoxDecoration(
                      // color: Colors.grey[200],
                      image: DecorationImage(
                        image: media.poster == null
                            ? AssetImage('assets/images/video.png')
                            : CachedNetworkImageProvider(
                                '${media.poster}',
                              ) as ImageProvider,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: Color.fromARGB(255, 216, 214, 214))),
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${media.title}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(LineIcons.play, color: Colors.orange, size: 20),
                        Text(
                          "${media.category?.designation}",
                          style: TextStyle(fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(LineIcons.calendar,
                            color: Colors.orange, size: 20),
                        Text(
                          "${media.dateAjout?.substring(0, 10)}",
                          style: TextStyle(fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            IconButton(
                onPressed: null,
                icon: Icon(
                  LineIcons.trash,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    ),
  );
}

Widget tileVideoShimmer() {
  return Padding(
    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
    child: Card(
      child: Container(
        height: 100,
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Color.fromARGB(255, 231, 230, 230),
                  highlightColor: Color.fromARGB(255, 245, 244, 244),
                  child: Container(
                    height: 80,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Color.fromARGB(255, 216, 214, 214))),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Color.fromARGB(255, 231, 230, 230),
                      highlightColor: Color.fromARGB(255, 245, 244, 244),
                      child: Container(
                        width: 150,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Shimmer.fromColors(
                      baseColor: Color.fromARGB(255, 231, 230, 230),
                      highlightColor: Color.fromARGB(255, 245, 244, 244),
                      child: Container(
                        height: 10,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    SizedBox(height: 8),
                    Shimmer.fromColors(
                      baseColor: Color.fromARGB(255, 231, 230, 230),
                      highlightColor: Color.fromARGB(255, 245, 244, 244),
                      child: Container(
                        height: 10,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

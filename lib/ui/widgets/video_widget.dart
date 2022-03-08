import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
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
                ? Svg('assets/images/video.svg')
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

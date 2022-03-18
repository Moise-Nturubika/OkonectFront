import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_icons/line_icons.dart';
import 'package:okonect/bloc/bloc_event.dart';
import 'package:okonect/bloc/block_state.dart';
import 'package:okonect/bloc/media/media_bloc.dart';
import 'package:okonect/models/media/media.dart';
import 'package:okonect/providers/statics.dart';
import 'package:okonect/ui/media/theme.dart';
import 'package:flutter/material.dart';
import 'package:okonect/ui/widgets/video_widget.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';
import 'package:getwidget/getwidget.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({
    Key? key,
    required this.media,
  }) : super(key: key);

  final Media media;

  @override
  State<StatefulWidget> createState() {
    return _VideoScreenState();
  }
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _videoPlayerController;
  // late VideoPlayerController _videoPlayerController2;
  ChewieController? _chewieController;
  late MediaBloc _bloc;
  bool _isDownloading = false;
  bool _isPaused = false;
  bool _iscanceled = false;
  late _TaskInfo _task;
  late String _localPath;
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    initializePlayer();
    _init();
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      if (true) {
        print('UI Isolate Callback: $data');
      }
      String? id = data[0];
      DownloadTaskStatus? status = data[1];
      int? progress = data[2];

      if (_task != null) {
        setState(() {
          _task.status = status;
          _task.progress = progress;
        });
      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    if (MyStatics.debug) {
      print(
          'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    }
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    _unbindBackgroundIsolate();
    super.dispose();
  }

  _init() {
    _bloc = new MediaBloc();
    _bloc.add(
        BlocEventSameCategoryFetch(category: "${widget.media.category?.id}"));
    _task = new _TaskInfo(
      name: widget.media.title,
      link: widget.media.file,
    );
    _prepareSaveDir();
    _bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback);
  }

  Future<void> initializePlayer() async {
    print("------------------------------------------------");
    print("${widget.media.file}");
    _videoPlayerController =
        VideoPlayerController.network('${widget.media.file}');
    // VideoPlayerController.asset('assets/video/videoTest.mp4');
    await Future.wait([_videoPlayerController.initialize()]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Color.fromARGB(255, 207, 124, 0),
        backgroundColor: Colors.white70,
        bufferedColor: Color.fromARGB(255, 243, 207, 153),
        handleColor: Color.fromARGB(255, 161, 97, 1),
      ),
      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: toggleVideo,
            iconData: Icons.live_tv_sharp,
            title: 'Toggle Video Src',
          ),
        ];
      },
      // subtitleBuilder: (context, dynamic subtitle) => Container(
      //   padding: const EdgeInsets.all(10.0),
      //   child: subtitle is InlineSpan
      //       ? RichText(
      //           text: subtitle,
      //         )
      //       : Text(
      //           subtitle.toString(),
      //           style: const TextStyle(color: Colors.black),
      //         ),
      // ),
    );
  }

  Future<void> toggleVideo() async {
    await _videoPlayerController.pause();
    await initializePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Center(
            child: _chewieController != null &&
                    _chewieController!.videoPlayerController.value.isInitialized
                ? Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Chewie(
                      controller: _chewieController!,
                    ))
                : Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[200],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SpinKitCircle(color: Colors.blue[900]),
                          SizedBox(height: 20),
                          Text('Loading...',
                              style: TextStyle(color: Colors.blue[900])),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 300,
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.media.category?.id == 2
                              ? "${widget.media.auteur} - ${widget.media.title}"
                              : "${widget.media.title}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(LineIcons.film, color: Colors.deepOrange),
                            SizedBox(
                              width: 10,
                            ),
                            Text("${widget.media.category?.designation}")
                          ],
                        ),
                      ],
                    ),
                    _isDownloading
                        ? Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (_task.status ==
                                      DownloadTaskStatus.complete) {
                                    _openDownloadedFile(_task);
                                  }
                                },
                                child: Container(
                                  width: 40,
                                  child: GFProgressBar(
                                      percentage: _task.progress! / 100,
                                      width: 40,
                                      radius: 40,
                                      child: Text('${_task.progress! / 100}%',
                                          style: TextStyle(
                                              fontSize: 5,
                                              fontWeight: FontWeight.bold)),
                                      type: GFProgressType.circular,
                                      backgroundColor: Colors.black26,
                                      progressBarColor:
                                          Color.fromARGB(255, 0, 72, 131)),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_isPaused) {
                                        _resumeDownload(task: _task);
                                      } else {
                                        _pauseDownload(task: _task);
                                      }
                                    });
                                  },
                                  icon: Icon(_isPaused
                                      ? LineIcons.pauseCircle
                                      : LineIcons.playCircle)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isDownloading = false;
                                      _cancelDownload(task: _task);
                                    });
                                  },
                                  icon: Icon(
                                    LineIcons.windowClose,
                                    color: Colors.red[900],
                                  )),
                            ],
                          )
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: Colors.deepOrange, width: 0.3)),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isDownloading = !_isDownloading;
                                    if (_task.status ==
                                        DownloadTaskStatus.undefined) {
                                      _requestDownload(task: _task);
                                    } else if (_task.status ==
                                        DownloadTaskStatus.running) {
                                      _pauseDownload(task: _task);
                                    } else if (_task.status ==
                                        DownloadTaskStatus.paused) {
                                      _resumeDownload(task: _task);
                                    } else if (_task.status ==
                                        DownloadTaskStatus.complete) {
                                      _delete(_task);
                                    } else if (_task.status ==
                                        DownloadTaskStatus.failed) {
                                      _retryDownload(task: _task);
                                    }
                                  });
                                },
                                icon: Icon(LineIcons.download)))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Author :",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                        )),
                    SizedBox(width: 8),
                    Text("${widget.media.auteur}")
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text("Added by :",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                        )),
                    SizedBox(width: 8),
                    Text("${widget.media.client?.fullname}")
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text("Date added :",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                        )),
                    SizedBox(width: 8),
                    Text("${widget.media.dateAjout?.substring(0, 19)}")
                  ],
                ),
                Divider(
                  height: 40,
                  color: Colors.grey[300],
                ),
                Text(
                  "Same category",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 150,
                    width: double.infinity,
                    child: BlocBuilder<MediaBloc, BlocState>(
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
                                (index) => cardVideo(
                                    title: state.data[index].title,
                                    category:
                                        state.data[index].category.designation,
                                    image: state.data[index].poster,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) => VideoScreen(
                                                  media: state.data[index])));
                                    })),
                            // children: [
                            // cardVideo(
                            //     title: 'CASA DE PAPEL',
                            //     category: 'Série',
                            //     image: 'assets/images/casa.jpg',
                            //     onPressed: () {
                            //       Navigator.of(context).push(MaterialPageRoute(
                            //           builder: (ctx) => VideoScreen()));
                            //     }),
                            // cardVideo(
                            //     title: 'SPIDER MAN',
                            //     category: 'Film',
                            //     image: 'assets/images/spiderman.jpg',
                            //     onPressed: () {}),
                            // cardVideo(
                            //     title: 'GAME OF THRONE',
                            //     category: 'Série',
                            //     image: 'assets/images/got.jpg',
                            //     onPressed: () {}),
                            // cardVideo(
                            //     title: 'ACHOUR',
                            //     category: 'Music',
                            //     image: 'assets/images/achour.jpg',
                            //     onPressed: () {}),
                            // cardVideo(
                            //     title: 'PEAKY BLINDERS',
                            //     category: 'Série',
                            //     image: 'assets/images/peaky.jpg',
                            //     onPressed: () {}),
                            // cardVideo(
                            //     title: 'SNAKE EYES',
                            //     category: 'Film',
                            //     image: 'assets/images/snakeeyes.jpg',
                            //     onPressed: () {}),
                            // ],
                          );
                        }
                        return Container();
                      },
                    )),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void _cancelDownload({required _TaskInfo task}) async {
    await FlutterDownloader.cancel(taskId: task.taskId!);
  }

  void _pauseDownload({required _TaskInfo task}) async {
    await FlutterDownloader.pause(taskId: task.taskId!);
  }

  void _resumeDownload({required _TaskInfo task}) async {
    String? newTaskId = await FlutterDownloader.resume(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  void _retryDownload({required _TaskInfo task}) async {
    String? newTaskId = await FlutterDownloader.retry(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  Future<bool> _openDownloadedFile(_TaskInfo? task) {
    if (task != null) {
      return FlutterDownloader.open(taskId: task.taskId!);
    } else {
      return Future.value(false);
    }
  }

  void _delete(_TaskInfo task) async {
    print("Deleting download...");
    await FlutterDownloader.remove(
        taskId: task.taskId!, shouldDeleteContent: true);
    // await _prepare();
    setState(() {});
    print("Download deleted succefully...");
  }

  void _requestDownload({required _TaskInfo task}) async {
    print("Requesting download...");
    task.taskId = await FlutterDownloader.enqueue(
      url: task.link!,
      headers: {"auth": "test_for_sql_encoding"},
      savedDir: _localPath,
      showNotification: true,
      openFileFromNotification: true,
      saveInPublicStorage: true,
    );
    print("Download launch succeffully........");
  }

  Future<void> _prepareSaveDir() async {
    print("Preparing save directory...");
    _localPath = (await _findLocalPath())!;
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    print("${savedDir.path} as created succefully....");
  }

  Future<String?> _findLocalPath() async {
    var externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (e) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }
}

class _TaskInfo {
  final String? name;
  final String? link;

  String? taskId;
  int? progress = 0;
  DownloadTaskStatus? status = DownloadTaskStatus.undefined;

  _TaskInfo({this.name, this.link, this.status});
}

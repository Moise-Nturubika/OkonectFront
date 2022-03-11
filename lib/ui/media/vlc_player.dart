// import 'package:flutter/material.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';

// class VlcPlayer extends StatefulWidget {
//   const VlcPlayer({Key? key}) : super(key: key);

//   @override
//   State<VlcPlayer> createState() => _VlcPlayerState();
// }

// class _VlcPlayerState extends State<VlcPlayer> {
//   VlcPlayerController? _videoPlayerController;

//   Future<void> initializePlayer() async {}

//   @override
//   void initState() {
//     super.initState();

//     _videoPlayerController = VlcPlayerController.network(
//       'https://media.w3.org/2010/05/sintel/trailer.mp4',
//       hwAcc: HwAcc.full,
//       autoPlay: false,
//       options: VlcPlayerOptions(),
//     );
//   }

//   @override
//   void dispose() async {
//     super.dispose();
//     await _videoPlayerController?.stopRendererScanning();
//     await _videoPlayerController?.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }



import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {  VideoPlayerScreen({Key? key}) : super(key: key);
@override
_VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}
class _VideoPlayerScreenState extends State {
  // late VideoPlayerController _controller;
  late Future _initializeVideoPlayerFuture;

  initFaceCamera() async {
    await FaceCamera.intialize(

    ).catchError((String ? e){
      print("The given error is: $e");
    });
  }

  @override
  void initState() {
    // Create an store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    if (!mounted) {
      return;
    }
    // initFaceCamera();
    // _controller = VideoPlayerController.network(
    //   'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    //
    //   videoPlayerOptions: VideoPlayerOptions(
    //     allowBackgroundPlayback: true
    //   )
    // );

    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
    _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(),
        betterPlayerDataSource: betterPlayerDataSource);

    // _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    // _controller.dispose();
    super.dispose();
  }

  BetterPlayerController ? _betterPlayerController;

  File? _capturedImage;

  Widget _message(String msg) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
        child: Text(msg,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14, height: 1.5, fontWeight: FontWeight.w400)),
      );

  @override
  Widget build(BuildContext context) {
    // Complete the code in the next step.
    return Scaffold(
      // floatingActionButton:
      // FloatingActionButton(
      //   onPressed: () {
      //     // Wrap the play or pause in a call to `setState`. This ensures the
      //     // correct icon is shown.
      //     setState(() {
      //       // If the video is playing, pause it.
      //       if (_controller.value.isPlaying) {
      //         _controller.pause();
      //       } else {
      //         // If the video is paused, play it.
      //         _controller.play();
      //       }
      //     });
      //
      //   },
      //   // Display the correct icon depending on the state of the player.
      //   child: Icon(
      //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Use a FutureBuilder to display a loading spinner while waiting for the
// VideoPlayerController to finish initializing.
//             FutureBuilder(
//               future: _initializeVideoPlayerFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   // If the VideoPlayerController has finished initialization, use
//                   // the data it provides to limit the aspect ratio of the video.
//                   return AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     // Use the VideoPlayer widget to display the video.
//                     child: VideoPlayer(_controller),
//                   );
//                 } else {
//                   // If the VideoPlayerController is still initializing, show a
//                   // loading spinner.
//                   return Center(child: CircularProgressIndicator());
//                 }
//               },
//             ),


            // AspectRatio(
            //     aspectRatio: 16 / 16,
            //     child:
            //     // BetterPlayer(
            //     //   controller: _betterPlayerController!,
            //     // )
            //
            //     BetterPlayer.network(
            //
            //       "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
            //
            //       betterPlayerConfiguration: BetterPlayerConfiguration(
            //         fit: BoxFit.contain,
            //         aspectRatio: 16 / 16,
            //       ),
            //     )
            // ),
            SmartFaceCamera(
              messageBuilder: (context,dy) {
                  print("The detection is : $dy");
                return Text("hi");
              },
              autoCapture: true,
              defaultCameraLens: CameraLens.front,
              message: 'Center your face in the square',
              onCapture: (File? image){



              },
            ),











    //
    //      _capturedImage != null ?
    //  Center(
    // child: Stack(
    // alignment: Alignment.bottomCenter,
    // children: [
    // Image.file(
    // _capturedImage!,
    // width: double.maxFinite,
    // fit: BoxFit.fitWidth,
    // ),
    // ElevatedButton(
    // onPressed: () => setState(() => _capturedImage = null),
    // child: const Text(
    // 'Capture Again',
    // textAlign: TextAlign.center,
    // style: TextStyle(
    // fontSize: 14, fontWeight: FontWeight.w700),
    // ))
    // ],
    // ),
    // )
    // : SmartFaceCamera(
    // autoCapture: true,
    // defaultCameraLens: CameraLens.front,
    // onCapture: (File? image) {
    // setState(() => _capturedImage = image);
    // },
    //
    // // onFaceDetected: (Face? face) {
    // // //Do something
    // // },
    // messageBuilder: (context, face) {
    // if (face == null) {
    // return _message('Place your face in the camera');
    // }
    // if (!face.wellPositioned) {
    // return _message('Center your face in the square');
    // }
    // return const SizedBox.shrink();
    // })











//     ]
//   )),
//   );
// }
            // SmartFaceCamera(
            //     autoCapture: true,
            //     defaultCameraLens: CameraLens.front,
            //     onCapture: (File? image) {
            //       setState(() =>
            //       // _capturedImage =
            //           print(image));
            //     },
            //
            //     // ,
            //     messageBuilder: (context, face) {
            //       if (face == null) {
            //         return _message('Place your face in the camera');
            //       }
            //       if (!face.wellPositioned) {
            //         return _message('Center your face in the square');
            //       }
            //       return const SizedBox.shrink();
            //     })
          ],
        ),

      ),
      //     FutureBuilder(
      //     future: null,
      //     builder:   (context,dynamic) {
      // // if (_capturedImage != null) {
      // return Center(
      // child: Stack(
      // alignment: Alignment.bottomCenter,
      // children: [
      // Image.file(
      // _capturedImage!,
      // width: double.maxFinite,
      // fit: BoxFit.fitWidth,
      // ),
      // ElevatedButton(
      // onPressed: () => setState(() => _capturedImage = null),
      // child: const Text(
      // 'Capture Again',
      // textAlign: TextAlign.center,
      // style: TextStyle(
      // fontSize: 14, fontWeight: FontWeight.w700),
      // ))
      // ],
      // ),
      // );
      // // }
      // }),

      // }

    );
  }

}
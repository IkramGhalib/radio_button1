// import 'package:flutter/material.dart';
//
//
//
// enum AudioState { recording, stop, play }
//
// const veryDarkBlue = Color(0xff172133);
// const kindaDarkBlue = Color(0xff202641);
// class RecordingScreen extends StatefulWidget {
//
// @override
// _RecordingScreenState createState() => _RecordingScreenState();
// }
//
// class _RecordingScreenState extends State<RecordingScreen> {
//   @override
//   Widget build(BuildContext context) {
  //   AudioState audioState;
  //   void handleAudioState(AudioState state) {
  //     setState(() {
  //       if (audioState == null) {
  //         // Starts recording
  //         audioState = AudioState.recording;
  //         // Finished recording
  //       } else if (audioState == AudioState.recording) {
  //         audioState = AudioState.play;
  //         // Play recorded audio
  //       } else if (audioState == AudioState.play) {
  //         audioState = AudioState.stop;
  //         // Stop recorded audio
  //       } else if (audioState == AudioState.stop) {
  //         audioState = AudioState.play;
  //       }
  //     });
  //   }
  //   @override
  //   Widget build(BuildContext context) {
  //     return MaterialApp(
  //         home: Scaffold(
  //           backgroundColor: Colors.blue,
  //           body: Center(
  //             child: Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //             AnimatedContainer(
  //             duration: Duration(milliseconds: 300),
  //             padding: EdgeInsets.all(24),
  //             decoration: BoxDecoration(
  //               shape: BoxShape.circle,
  //               // color: handleAudioColour(),
  //             ),
  //             child: RawMaterialButton(
  //                 fillColor: Colors.white,
  //                 shape: CircleBorder(),
  //                 padding: EdgeInsets.all(30),
  //                 onPressed: () => handleAudioState(audioState)
  //                 // child: getIcon(audioState),
  //           ),
  //         ),
  //         SizedBox(width: 20),
  //         if (audioState == AudioState.play ||
  //     audioState == AudioState.stop)
  //     Container(
  //       padding: EdgeInsets.all(24),
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: kindaDarkBlue,
  //       ),
  //       child: RawMaterialButton(
  //         fillColor: Colors.white,
  //         shape: CircleBorder(),
  //         padding: EdgeInsets.all(30),
  //         onPressed: () =>
  //             setState(() {
  //               audioState = null;
  //             }),
  //         child: Icon(Icons.replay, size: 50),
  //       ),
  //     )
  //     ,
  //     ],
  //     ),
  //     ),
  //     ),
  //     );
  //   }
  //   Color handleAudioColour() {
  //     if (audioState == AudioState.recording) {
  //       return Colors.deepOrangeAccent.shade700.withOpacity(0.5);
  //     } else if (audioState == AudioState.stop) {
  //       return Colors.green.shade900;
  //     } else {
  //       return kindaDarkBlue;
  //     }
  //   }
  // }

//   getIcon(AudioState audioState) {}
// }

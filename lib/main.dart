import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'package:covid19_check/HomePage.dart';

void main() => runApp(
    MyApp());

String choice;
String _radioValue;
enum AudioState { recording, stop, play }
const veryDarkBlue = Color(0xff172133);
const kindaDarkBlue = Color(0xff202641);

// String _selectedCity;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.person),
        title: Text("Covid Cough Test"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Q:1. Do You have any fever and muscular pain"),
                  SizedBox(width: 25),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //     Radio(
                      //       value: 'one',
                      //       groupValue: _radioValue,
                      //       onChanged: radioButtonChanges,
                      //     ),
                      //     Text(
                      //       "Yes",
                      //     ),
                      //     Radio(
                      //       value: 'two',
                      //       groupValue: _radioValue,
                      //       onChanged: radioButtonChanges,
                      //     ),
                      //     Text(
                      //       "No",
                      //     ),

                    ],),
                ],
              ),
              SizedBox(width: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Radio(
                    value: 'one',
                    groupValue: _radioValue,
                    onChanged: radioButtonQ1,
                  ),
                  Text(
                    "Yes",
                  ),
                  Radio(
                    value: 'two',
                    groupValue: _radioValue,
                    onChanged: radioButtonQ2,
                  ),
                  Text(
                    "No",
                  ),
                ],
              ),

              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Q:2. Do you have respiratory Problem "),
                  //     SizedBox(width: 25),
                  //     Radio(
                  //       value: 'one',
                  //       groupValue: _radioValue,
                  //       onChanged: radioButtonChanges,
                  //     ),
                  //
                  //     Text(
                  //       "Yes",
                  //     ),
                  //     Radio(
                  //       value: 'two',
                  //       groupValue: _radioValue,
                  //       onChanged: radioButtonChanges,
                  //     ),
                  //     Text(
                  //       "No",
                  //     ),
                ],
              ),
              SizedBox(width: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Radio(
                    value: 'one',
                    groupValue: _radioValue,
                    onChanged: radioButtonQ1,
                  ),
                  Text(
                    "Yes",
                  ),
                  Radio(
                    value: 'two',
                    groupValue: _radioValue,
                    onChanged: radioButtonQ2,
                  ),
                  Text(
                    "No",
                  ),
                ],
              ),


              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => RecordingScreen()));
                    },
                    child: new Text("Next"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void radioButtonQ1(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = "";
          break;
        case 'two':
          choice = " ";
          break;
        default:
          choice = null;
      }
      debugPrint(choice);
    });
  }

  void radioButtonQ2(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = "";
          break;
        case 'two':
          choice = " ";
          break;
        default:
          choice = null;
      }
      debugPrint(choice);
    });
  }
}
class RecordingScreen extends StatefulWidget {
  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  @override
  Widget build(BuildContext context) {
    AudioState audioState;
    void handleAudioState(AudioState state) {
      setState(() {
        if (audioState == null) {
          // Starts recording
          audioState = AudioState.recording;
          // Finished recording
        } else if (audioState == AudioState.recording) {
          audioState = AudioState.play;
          // Play recorded audio
        } else if (audioState == AudioState.play) {
          audioState = AudioState.stop;
          // Stop recorded audio
        } else if (audioState == AudioState.stop) {
          audioState = AudioState.play;
        }
      });
    }
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: handleAudioColour(),
                  ),
                  child: RawMaterialButton(
                      fillColor: Colors.white,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30),
                      onPressed: () => handleAudioState(audioState)
                    // child: getIcon(audioState),
                  ),
                ),
                SizedBox(width: 20),
                if (audioState == AudioState.play ||
                    audioState == AudioState.stop)
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kindaDarkBlue,
                    ),
                    child: RawMaterialButton(
                      fillColor: Colors.white,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30),
                      onPressed: () =>
                          setState(() {
                            audioState = null;
                          }),
                      child: Icon(Icons.replay, size: 50),
                    ),
                  )
                ,
              ],
            ),
          ),
        ),
      );
    }
    Color handleAudioColour() {
      if (audioState == AudioState.recording) {
        return Colors.deepOrangeAccent.shade700.withOpacity(0.5);
      } else if (audioState == AudioState.stop) {
        return Colors.green.shade900;
      } else {
        return kindaDarkBlue;
      }
    }
  }
}
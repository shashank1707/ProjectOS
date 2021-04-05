import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SemaphoreHomePage extends StatefulWidget {
  SemaphoreHomePage({Key key}) : super(key: key);

  @override
  _SemaphoreHomePageState createState() => _SemaphoreHomePageState();
}

class _SemaphoreHomePageState extends State<SemaphoreHomePage> {
  YoutubePlayerController _controller;

  void runYouTubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=VcVbUbPNIfw&t=17s"),
      flags: YoutubePlayerFlags(),
    );
  }

  @override
  void initState() {
    runYouTubePlayer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) {
          return Scaffold(
            appBar: NewGradientAppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop()),
              title: Text("SEMAPHORES"),
              gradient:
                  LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text("Theory on Semaphores:", style: TextStyle(fontStyle: FontStyle.italic, height: 2, fontSize: 30, color: Color(0xFF5DA3FA), fontWeight: FontWeight.bold ) ,),
                  Text("Semaphores are integer variables that are used to solve the critical section problem by using two atomic operations, wait and signal that are used for process synchronization. The definitions of wait and signal are as follows − Wait. The wait operation decrements the value of its argument S, if it is positive",textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),),
                  SizedBox(height: 40.0),
                  Text("Watch the video for more detail on Semaphores",textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green[300], fontSize: 17),),
                  player,
                  SizedBox(height: 20.0),
                  SizedBox(height: 20.0),
                  Text("Instructions:", style: TextStyle(fontStyle: FontStyle.italic, height: 2, fontSize: 30, color: Colors.blue[400], fontWeight: FontWeight.bold ) ,),
                  Text("1. You basically add process from the bottom bar as much as you want or for binary algorithms you will already find it there",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                  Text("2. Enter the initial semaphore value. This will decide max amount of processes can be critical section at one moment of time. For Binary Semaphores it is by defualt 1.",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                  Text("3. The state of process will get marked with red color",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                  Text("4. Click on the blue process button to make the state go ahead",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                  Text("5. The value of X is the semaphore value. Click on it to reset",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                  Text("These steps are for the following algorithms: Binary Semaphores and Counting Semapopres", textAlign: TextAlign.left,),SizedBox(height: 20.0),
                ] 
            )
            )
          );
        });
  }
}

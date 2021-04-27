import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DeadlockHomePage extends StatefulWidget {
  DeadlockHomePage({Key key}) : super(key: key);

  @override
  _DeadlockHomePageState createState() => _DeadlockHomePageState();
}

class _DeadlockHomePageState extends State<DeadlockHomePage> {
  YoutubePlayerController _controller;

  void runYouTubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=rWFH6PLOIEI&list=PLxCzCOWd7aiGz9donHRrE9I3Mwn6XdP8p&index=36"),
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
              title: Text("DEADLOCK"),
              gradient:
                  LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text("Theory on Deadlock:", style: TextStyle(fontStyle: FontStyle.italic, height: 2, fontSize: 30, color: Color(0xFF5DA3FA), fontWeight: FontWeight.bold ) ,),
                  Text("Deadlock is a situation where a set of processes are blocked because each process is holding a resource and waiting for another resource acquired by some other process",textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),),
                  SizedBox(height: 40.0),
                  Text("Watch the video for more detail on Deadlock",textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green[300], fontSize: 17),),
                  player,
                  SizedBox(height: 40.0),
                  Text("Instructions:", style: TextStyle(fontStyle: FontStyle.italic, height: 2, fontSize: 30, color: Colors.blue[400], fontWeight: FontWeight.bold ) ,),
                  Text("1. Enter the NUMBER of resources and Processess and click NEXT.",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                  Text("2. Enter Available Resources, Allocated Resources and Max Resources and click NEXT.",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                  Text("3. It might take time to respond as it is very long algorithm so wait for it to give answer.",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                  Text("4. Note that you need to enter proper numerical values otherwise it will return as DEADLOCK",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                ] 
            )
            )
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ConcurrencyHomePage extends StatefulWidget {
  ConcurrencyHomePage({Key key}) : super(key: key);

  @override
  _ConcurrencyHomePageState createState() => _ConcurrencyHomePageState();
}

class _ConcurrencyHomePageState extends State<ConcurrencyHomePage> {
  YoutubePlayerController _controller;

  void runYouTubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=3Eaw1SSIqRg&list=PLxCzCOWd7aiGz9donHRrE9I3Mwn6XdP8p&index=25"),
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
              title: Text("CONCURRENCY"),
              gradient:
                  LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text("Theory on Concurrency:", style: TextStyle(fontStyle: FontStyle.italic, height: 2, fontSize: 30, color: Color(0xFF5DA3FA), fontWeight: FontWeight.bold ) ,),
                  Text("Concurrency means multiple computations are happening at the same time. Concurrency is everywhere in modern programming, whether we like it or not: Multiple computers in a network. Multiple applications running on one computer. Multiple processors in a computer (today, often multiple processor cores on a single chip)",textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),),
                  SizedBox(height: 40.0),
                  Text("Watch the video for more detail on Concurrency",textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green[300], fontSize: 17),),
                  player,
                  SizedBox(height: 20.0),
                  SizedBox(height: 20.0),
                  Text("Instructions:", style: TextStyle(fontStyle: FontStyle.italic, height: 2, fontSize: 30, color: Colors.blue[400], fontWeight: FontWeight.bold ) ,),
                  Text("1. You basically add process from the bottom bar as much as you want or for binary algorithms you will already find it there",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                  Text("2. The state of process will get marked with red color",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                  Text("3. Click on the blue process button to make the state go ahead",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                  Text("4. When you are done or you observe you have made a mistake, click on the floating button to reset",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                  Text("These steps are for the following algorithms: Lock Variable, Test and Set, Turn Variable and Petersons", textAlign: TextAlign.left,),SizedBox(height: 20.0),
                ] 
            )
            )
          );
        });
  }
}

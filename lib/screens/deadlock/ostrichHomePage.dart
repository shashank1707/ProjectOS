import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class OstrichHomePage extends StatefulWidget {
  OstrichHomePage({Key key}) : super(key: key);

  @override
  _OstrichHomePageState createState() => _OstrichHomePageState();
}

class _OstrichHomePageState extends State<OstrichHomePage> {
  YoutubePlayerController _controller;

  List pathik = [];


  Future<void> _showMyDialog() async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!', style: TextStyle(fontSize: 20) ,),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your device is hanged! Please restart!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(' '),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void hangUp(){
    setState(() {
      for(int i = 1 ; i < 40 ; i++){
        pathik.add('You need restart app to remove this deadlock infinte loop');
      }
    });
    _showMyDialog();
  }

  void runYouTubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=Rz3CtjMc7Hc"),
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
              title: Text("OSTRICH METHOD"),
              gradient:
                  LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [ 
                  Text("This is the fourth method of handling DEADLOCKS. In this, we work without the stress of DEADLOCK occuring. When it occurs we simply restart the system. This is called Ostrich method.", textAlign: TextAlign.center,),
                  Text("Instructions:", style: TextStyle(fontStyle: FontStyle.italic, height: 2, fontSize: 30, color: Colors.blue[400], fontWeight: FontWeight.bold ) ,),
                  Text("1. On Clicking the Warning Button, a basic DEADLOCK of 2 resource and 2 process occur.",textAlign: TextAlign.center,),SizedBox(height: 20.0),
                  Text("2. The process prints a predefined statement untill the deadlock is resolved.",textAlign: TextAlign.center,),SizedBox(height: 20.0),
                  Text("3. To resolve this DEADLOCK, restart the app.",textAlign: TextAlign.left,),SizedBox(height: 20.0),
                  Text("This will hang your device. If you want to risk that press the below button", textAlign: TextAlign.center,),
                  TextButton(
                    onPressed: (){
                      hangUp();
                    },
                    child: Text('Warning!', style: TextStyle(fontSize: 40, color: Colors.red) ,),
                  ),
                  ...(pathik).map((hello){
                    return Text(hello);
                  })
                ]
              ),
            )
          );
        });
  }
}

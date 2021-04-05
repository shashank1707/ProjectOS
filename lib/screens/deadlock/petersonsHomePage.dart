import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PetersonsHomePage extends StatefulWidget {
  PetersonsHomePage({Key key}) : super(key: key);

  @override
  _PetersonsHomePageState createState() => _PetersonsHomePageState();
}

class _PetersonsHomePageState extends State<PetersonsHomePage> {
  YoutubePlayerController _controller;

  int counter = 0;
  List<Color> entry = new List.filled(2, Colors.transparent);
  List<Color> critical = new List.filled(2, Colors.transparent);
  List<Color> finish = new List.filled(2, Colors.transparent);
  int turn = 0;
  bool criticalEmpty = true;
  List<bool> flag = [false, false];

  void reset() {
    setState(() {
      counter = 0;
      turn = 0;
      flag[0] = false;
      flag[1] = false;
      for (int i = 0; i < 2; i++) {
        critical[i] = Colors.transparent;
        finish[i] = Colors.transparent;
        entry[i] = Colors.transparent;
      }
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'You cannot make P2 enter Critical section because P1 has chance now and TURN = 0 and Flag = [True,False]'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _wowDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'You cannot make P1 enter Critical section because P2 is still inside and TURN = 1 and Flag = [False,True]'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void flagLog(lol) {
    if (critical[1] == Colors.red) entry[1] = Colors.transparent;
    if (critical[1] == Colors.transparent) entry[1] = Colors.red;
  }

  void varLogic(int nisarg) {
    setState(() {
      if (finish[nisarg] != Colors.red) {
        if (criticalEmpty && finish[nisarg] == Colors.transparent) {
          criticalEmpty = false;
          critical[nisarg] = Colors.red;
          entry[nisarg] = Colors.transparent;
        } else if (critical[nisarg] == Colors.red) {
          criticalEmpty = true;
          critical[nisarg] = Colors.transparent;
          finish[nisarg] = Colors.red;
        } else {
          entry[nisarg] = Colors.red;
        }
      }
    });
  }

  // void varLogic(int nisarg) {
  //   setState(() {
  //     if (flag[0] = false) {
  //       if (finish[nisarg] != Colors.red) {
  //         if (criticalEmpty && finish[nisarg] == Colors.transparent) {
  //           criticalEmpty = false;
  //           critical[nisarg] = Colors.red;
  //           entry[nisarg] = Colors.transparent;
  //         } else if (critical[nisarg] == Colors.red) {
  //           criticalEmpty = true;
  //           critical[nisarg] = Colors.transparent;
  //           finish[nisarg] = Colors.red;
  //         } else {
  //           entry[nisarg] = Colors.red;
  //         }
  //       }
  //     // } else if (flag[0] == true && flag[1] == true) {
  //     //   _wowDialog();
  //     else if (){}
  //     }
  //   });
  // }

  void runYouTubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=9hzoO4hBXFw&list=PLxCzCOWd7aiGz9donHRrE9I3Mwn6XdP8p&index=88"),
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
              title: Text("Peterson's Solution"),
              gradient:
                  LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            ),
            body: CustomScrollView(slivers: <Widget>[
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SizedBox(height: 12.0),
                    // player,
                    // SizedBox(height: 12.0),
                    Text('Process'),
                    Text('Entry'),
                    Text('Critical'),
                    Text('Finished'),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (turn == 0) varLogic(0);
                                if (critical[0] == Colors.red ||
                                    entry[0] == Colors.red) turn = 0;
                                if (finish[0] == Colors.red) turn = 1;
                              },
                              child: Text('P1')),

                          FlatButton(
                            color: Colors.transparent,
                            onPressed: () {},
                            child: Icon(
                              Icons.circle,
                              color: entry[0],
                            ),
                          ), //entry

                          FlatButton(
                            color: Colors.transparent,
                            onPressed: () {},
                            child: Icon(
                              Icons.circle,
                              color: critical[0],
                            ),
                          ), //cs

                          FlatButton(
                            color: Colors.transparent,
                            onPressed: () {},
                            child: Icon(
                              Icons.circle,
                              color: finish[0],
                            ),
                          ), //ended
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (turn == 1) {
                                  varLogic(1);
                                }
                                if (critical[1] == Colors.red ||
                                    entry[0] == Colors.red) turn = 1;
                                if (finish[1] == Colors.red) turn = 0;
                                if (critical[0] == Colors.transparent &&
                                    finish[0] == Colors.transparent)
                                  _showMyDialog();
                                if (critical[0] == Colors.red) {
                                  _wowDialog();
                                }
                              },
                              child: Text('P2')),

                          FlatButton(
                            color: Colors.transparent,
                            onPressed: () {},
                            child: Icon(
                              Icons.circle,
                              color: entry[1],
                            ),
                          ), //entry

                          FlatButton(
                            color: Colors.transparent,
                            onPressed: () {},
                            child: Icon(
                              Icons.circle,
                              color: critical[1],
                            ),
                          ), //cs

                          FlatButton(
                            color: Colors.transparent,
                            onPressed: () {},
                            child: Icon(
                              Icons.circle,
                              color: finish[1],
                            ),
                          ), //ended
                        ],
                      ),
                    ])),
              ),
            ]),
            bottomNavigationBar: Container(
              color: Colors.blue,
              child: FlatButton(
                child: Text('Reset'),
                onPressed: () {
                  setState(() {
                    reset();
                  });
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                reset();
              },
              child: const Icon(Icons.refresh_outlined),
            ),
          );
        });
  }
}

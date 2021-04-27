import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BinaryHomePage extends StatefulWidget {
  BinaryHomePage({Key key}) : super(key: key);

  @override
  _BinaryHomePageState createState() => _BinaryHomePageState();
}

class _BinaryHomePageState extends State<BinaryHomePage> {
  YoutubePlayerController _controller;

  int counter = 0;
  List<Map> process = [];
  bool criticalEmpty = true;
  int bin = 1;

  void addProcess() {
    setState(() {
      process.add({
        'Number': counter++,
        'critical': Colors.transparent,
        'entry': Colors.transparent,
        'finished': Colors.transparent,
      });
    });
  }

  void reset() {
    setState(() {
      counter = 0;
      process = [];
    });
  }

  void bSem() {
    if (criticalEmpty == true) bin = 1;
    if (criticalEmpty == false) bin = 0;
  }

  void varLogic(pathik) {
    setState(() {
      if (pathik['finished'] != Colors.red) {
        if (criticalEmpty &&
            pathik['finished'] == Colors.transparent &&
            pathik['critical'] != Colors.red) {
          criticalEmpty = false;
          pathik['critical'] = Colors.red;
          pathik['entry'] = Colors.transparent;
        } else if (pathik['critical'] == Colors.red) {
          criticalEmpty = true;
          pathik['critical'] = Colors.transparent;
          pathik['finished'] = Colors.red;
        } else {
          pathik['entry'] = Colors.red;
        }
      }
    });
  }

  void runYouTubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=TrV_dOX_YHw&list=PLxCzCOWd7aiGz9donHRrE9I3Mwn6XdP8p&index=29"),
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
              title: Text("Binary Semaphores"),
              gradient:
                  LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
            ),
            body: CustomScrollView(slivers: <Widget>[
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Process'),
                    Text('Entry'),
                    Text('Buffer'),
                    Text('Finished'),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    ...(process).map((pathik) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                varLogic(pathik);
                                bSem();
                              },
                              child: Text('P${pathik['Number']}')),

                          FlatButton(
                            color: Colors.transparent,
                            onPressed: () {},
                            child: Icon(Icons.circle, color: pathik['entry']),
                          ), //entry

                          FlatButton(
                            color: Colors.transparent,
                            onPressed: () {},
                            child:
                                Icon(Icons.circle, color: pathik['critical']),
                          ), //cs

                          FlatButton(
                            color: Colors.transparent,
                            onPressed: () {},
                            child:
                                Icon(Icons.circle, color: pathik['finished']),
                          ), //ended
                        ],
                      );
                    })
                  ]),
                ),
              ),
            ]),
            bottomNavigationBar: Container(
              color: Colors.blue,
              child: FlatButton(
                child: Text('Add Process'),
                onPressed: () {
                  setState(() {
                    addProcess();
                  });
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                reset();
              },
              child: Text("X=$bin"),
            ),
          );
        });
  }
}

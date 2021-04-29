// import 'package:project_os/screens/disk/screens/clook_screen.dart';
// import 'package:project_os/screens/disk/screens/cscan_screen.dart';
// import 'package:project_os/screens/disk/screens/fcfs_screen.dart';
// import 'package:project_os/screens/disk/screens/fscan_screen.dart';
// import 'package:project_os/screens/disk/screens/lifo_screen.dart';
// import 'package:project_os/screens/disk/screens/look_screen.dart';
// import 'package:project_os/screens/disk/screens/n_step_scan_screen.dart';
// import 'package:project_os/screens/disk/screens/rss_screen.dart';
// import 'package:project_os/screens/disk/screens/scan_screen.dart';
// import 'package:project_os/screens/disk/screens/sstf_screen.dart';
import 'package:project_os/screens/disk/screens/algo_implement_screen.dart';
import 'package:project_os/screens/disk/bar_grapgh_syncfusion.dart';
import 'package:flutter/material.dart';

class ListOfAlgorithms extends StatelessWidget {
  final list = [
    'FCFS',
    'SSTF',
    'SCAN',
    'CSCAN',
    'LOOK',
    'CLOOK',
    // 'RSS',
    // 'LIFO',
    // 'N-STEP-SCAN',
    // 'FSCAN'
  ];

  // final route = [FcfsScreen, SstfScreen, ScanScreen, CscanScreen, LookScreen, ClookScreen, RssScreen, LifoScreen, NStepScanScreen, FscanScreen];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.cyan,
        // elevation: 4,
        title: Text(
          'List of Algorithms',
          style: TextStyle(
              color: Colors.black,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  button(context, 'FCFS', 'First Come First Serve',Color.fromRGBO(204, 43, 94, 1.0),
                      Color.fromRGBO(117, 58, 136, 1.0)),
                  button(context, 'SSTF', 'Shortest Seek Time First', Color.fromRGBO(46, 49, 146, 1.0),
                      Color.fromRGBO(27, 255, 255, 1.0)),
                  button(context, 'SCAN', 'Elevator Algorithm', Color.fromRGBO(255, 81, 47, 1.0),
                      Color.fromRGBO(221, 36, 118, 1.0)),
                  button(context, 'CSCAN', 'Circular Elevator Algorithm', Color.fromRGBO(97, 67, 133, 1.0),
                      Color.fromRGBO(81, 99, 149, 1.0)),
                  button(context, 'LOOK', 'Advanced Elevator Algorithm', Color.fromRGBO(2, 170, 189, 1.0),
                      Color.fromRGBO(0, 205, 172, 1.0)),
                  button(context, 'CLOOK', 'Advanced Circular Elevator Algorithm', Color.fromRGBO(102, 45, 140, 1.0),
                      Color.fromRGBO(237, 30, 121, 1.0)),
                  // BarGraphSyncfusion([12, 26, 47, 8, 56, 74])//, [0,1,2,3,4,])
                ],
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AlgoImplementScreen('Compare')));
              },
              elevation: 0,
              child: Text('Compare Algorithms', style: TextStyle(fontSize: 18),),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Colors.cyan,
            ),
          ],
        ),
      ),
    );
  }

  Widget button(BuildContext ctx, String text, String subtitle, Color a, Color b) {
    return InkWell(
      onTap: () {
        Navigator.of(ctx).push(
          MaterialPageRoute(
            builder: (ctx) => AlgoImplementScreen(text),
          ),
        );
      },
      child: Container(
        height: 75,
        margin: EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          // color: Color(0xFFEFF3F6),
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [a, b],

            // begin: Alignment.topRight,
            // end: Alignment.bottomLeft,
            stops: [0.1, 0.9],
          ),
          // boxShadow: [
          //   BoxShadow(
          //       color: Color.fromRGBO(0, 0, 0, 0.1),
          //       offset: Offset(2, 1),
          //       blurRadius: 3.0,
          //       spreadRadius: 2.0),
          //   BoxShadow(
          //       color: Colors.white.withOpacity(0.9),
          //       offset: Offset(-3, -3),
          //       blurRadius: 3.0,
          //       spreadRadius: 1.0)
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
/*
child: GridView.builder(
                  // itemBuilder: (ctx, i) {
                  //   return button(context, list[i]);
                  // },
                  // itemCount: 10,

                  itemCount: list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2 / 1),
                  itemBuilder: (ctx, i) {
                    return button(context, list[i]);
                  }),


// return RaisedButton(
    //   onPressed: () {
    //     Navigator.of(ctx).push(
    //       MaterialPageRoute(
    //         builder: (ctx) => AlgoImplementScreen(text),
    //       ),
    //     );
    //   },
    //   child: Text(
    //     text,
    //     textAlign: TextAlign.left,
    //     style: TextStyle(fontSize: 18, color: Colors.blue),
    //   ),
    // );
    // return ListTile(
    //   leading: Icon(Icons.send),
    //   title: Text(text),
    //   tileColor: Colors.red,
    //   onTap: () {
    //     Navigator.of(ctx).push(
    //       MaterialPageRoute(
    //         builder: (ctx) => AlgoImplementScreen(text),
    //       ),
    //     );
    //   },
    // );

 */

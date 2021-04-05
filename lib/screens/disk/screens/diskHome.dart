import '../description/disk_scheduling_description.dart';
import 'package:flutter/material.dart';

import 'list_of_algorithms.dart';

class DiskHome extends StatefulWidget {
  @override
  _DiskHomeState createState() => _DiskHomeState();
}

class _DiskHomeState extends State<DiskHome> {
  // var text = RichText(
  //   text: TextSpan(
  //     children: [
  //       TextSpan(text: s1),
  //     ],
  //     style: TextStyle(fontSize: 18),
  //   ),
  //   textAlign: TextAlign.left,
  // );
  // final s1 =
  //     "As we know, a process needs two type of time, CPU time and IO time. For I/O, it requests the Operating system to access the disk. However, the operating system must be fare enough to satisfy each request and at the same time, operating system must maintain the efficiency and speed of process execution. The technique that operating system uses to determine the request which is to be satisfied next is called disk scheduling.";
  //
  // String s2 = "Let's discuss some important terms related to disk scheduling.";
  //
  // String s3 =
  //     "Seek time: It is the time taken in locating the disk arm to a specified track where the read/write request will be satisfied.";
  // String s4 =
  //     "Rotational Latency: It is the time taken by the desired sector to rotate itself to the position from where it can access the R/W heads.";
  // String s5 = "Transfer Time: It is the time taken to transfer the data.";
  // String s6 =
  //     "Disk Access Time: It is given as,\nDisk Access Time = Rotational Latency + Seek Time + Transfer Time";
  // String s7 =
  //     "Disk Response Time: It is the average of time spent by each request waiting for the IO operation.";
  // String s8 =
  //     "Purpose of Disk Scheduling: The main purpose of disk scheduling algorithm is to select a disk request from the queue of IO requests and decide the schedule when this request will be processed.";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.black,
          primarySwatch: Colors.grey,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white),
            headline1: TextStyle(color: Colors.white),
          )),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  color: Colors.cyan,
                  icon: Icon(Icons.arrow_back_rounded, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Disk Scheduling",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DiskSchedulingDescription(),
                ),
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.all(16.0),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ListOfAlgorithms(),
                  ),
                );
              },
              child: Text(
                'Algorithms',
                style: TextStyle(fontSize: 18),
              ),
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Colors.cyan,
            )
          ],
        ),
      ),
    );
  }
}

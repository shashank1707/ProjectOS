import 'package:flutter/material.dart';

class DiskSchedulingDescription extends StatelessWidget {
  final s1 =
      "As we know, a process needs two type of time, CPU time and IO time. For I/O, it requests the Operating system to access the disk. However, the operating system must be fare enough to satisfy each request and at the same time, operating system must maintain the efficiency and speed of process execution. The technique that operating system uses to determine the request which is to be satisfied next is called disk scheduling.\n\n";

  final s2 = "Let's discuss some important terms related to disk scheduling.\n\n";

  final s3 =
      "It is the time taken in locating the disk arm to a specified track where the read/write request will be satisfied.\n\n";
  final s4 =
      "It is the time taken by the desired sector to rotate itself to the position from where it can access the R/W heads.\n\n";
  final s5 = "It is the time taken to transfer the data.\n\n";
  final s6 =
      "It is given as,\nDisk Access Time = Rotational Latency + Seek Time + Transfer Time\n\n";
  final s7 =
      "It is the average of time spent by each request waiting for the IO operation.\n\n";
  final s8 =
      "The main purpose of disk scheduling algorithm is to select a disk request from the queue of IO requests and decide the schedule when this request will be processed.\n";
  @override
  Widget build(BuildContext context) {
    return RichText(

      text: TextSpan(

        children: [
          TextSpan(text: s1),
          TextSpan(text: s2),
          TextSpan(text: 'Seek time: ', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: s3),
          TextSpan(text: 'Rotational Latency: ', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: s4),
          TextSpan(text: 'Transfer Time: ', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: s5),
          TextSpan(text: 'Disk Access Time: ', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: s6),
          TextSpan(text: 'Disk Response Time: ', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: s7),
          TextSpan(text: 'Purpose of Disk Scheduling: ', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: s8),
        ],
        style: TextStyle(fontSize: 18,color: Colors.white),
      ),
      textAlign: TextAlign.justify,

    );

  }
}

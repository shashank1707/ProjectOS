import 'package:flutter/material.dart';

class SstfDescription extends StatelessWidget {
  final s1 ="Shortest seek time first (SSTF) algorithm selects the disk I/O request which requires the least disk arm movement from its current position regardless of the direction. It reduces the total seek time as compared to FCFS.\n";
     

  final s2 = "It allows the head to move to the closest track in the service queue. \n";

  final s3 =
      "It may cause starvation for some requests.\n\n";
  final s4 =
      "It provides better throughput.\n\n";
  final s5 = "This algorithm is used in Batch Processing system where throughput is more important.\n\n";
  
  @override
  Widget build(BuildContext context) {
    return RichText(

      text: TextSpan(

        children: [
          TextSpan(text: s1),
          TextSpan(text: s2),
          
          TextSpan(text: s3),
          
          TextSpan(text: s4),
         
          TextSpan(text: s5),
          
        ],
        style: TextStyle(fontSize: 18,color: Colors.white),
      ),
      textAlign: TextAlign.justify,

    );

  }
}


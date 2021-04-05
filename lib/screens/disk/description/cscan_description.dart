import 'package:flutter/material.dart';

class CscanDescription extends StatelessWidget {
  final s1 ="In C-SCAN algorithm, the arm of the disk moves in a particular direction servicing requests until it reaches the last cylinder, then it jumps to the last cylinder of the opposite direction without servicing any request then it turns back and start moving in that direction servicing the remaining requests.\n";
     

  final s2 = "It services the requests in one direction only.\n";

  final s3 =
      "C-SCAN Algorithm provides uniform waiting time in requesting the locations over Elevator Algorithm.\n\n";
  final s4 =
      "This algorithm provides better response time.\n\n";
  
  @override
  Widget build(BuildContext context) {
    return RichText(

      text: TextSpan(

        children: [
          TextSpan(text: s1),
          TextSpan(text: s2),
          
          TextSpan(text: s3),
          
          TextSpan(text: s4),
         
          
        ],
        style: TextStyle(fontSize: 18,color: Colors.white),
      ),
      textAlign: TextAlign.justify,

    );

  }
}


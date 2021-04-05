import 'package:flutter/material.dart';

class CLookDescription extends StatelessWidget {
  final s1 ="C Look Algorithm is similar to C-SCAN algorithm to some extent. In this algorithm, the arm of the disk moves outwards servicing requests until it reaches the highest request cylinder, then it jumps to the lowest request cylinder without servicing any request then it again start moving outwards servicing the remaining requests.\n";
     

  final s2 = "It is different from C SCAN algorithm in the sense that, C SCAN force the disk arm to move till the last cylinder regardless of knowing whether any request is to be serviced on that cylinder or not.\n";

  final s3 =
      "In this algorithm, head can serve request only in one direction\n\n";
  final s4 =
      "It provides uniform waiting time and response time\n\n";
  final s5 = "It has the best performance overall as compared to all the alogrithms. And it can handle requests more efficiently.\n\n";
  
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


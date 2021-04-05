import 'package:flutter/material.dart';

class LookDescription extends StatelessWidget {
  final s1 ="LOOK Algorithm is an improved version of the SCAN Algorithm. Head starts from the first request at one end of the disk and moves towards the last request at the other end servicing all the requests in between. After reaching the last request at the other end, head reverses its direction.\n";
     

  final s2 = "Head starts from the first request at one end of the disk and moves towards the last request at the other end servicing all the requests in between. .\n";

  final s3 =
      "It provides low variance in response time and waiting time\n\n";
  final s4 =
      "\n\n";
  final s5 = "There is an overhead of finding the end requests.\n\n";
  
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


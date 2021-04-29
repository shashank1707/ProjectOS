import 'package:flutter/material.dart';

class ScanDescription extends StatelessWidget {
  final s1 =" It is also called as Elevator Algorithm. In this algorithm, the disk arm moves into a particular direction till the end, satisfying all the requests coming in its path,and then it turns backand moves in the reverse direction satisfying requests coming in its path.\n";
     

  final s2 = "SCAN algorithm have no starvation \n";
  

  final s3 =
      "It provides low variance in response time and waiting time.\n\n";
  final s4 =
      "It causes long waiting time for the cylinders just visited by the head\n\n";
  final s5 = "It causes the head to move till the end of the disk in this way the requests arriving ahead of the arm position would get immediate service but some other requests that arrive behind the arm position will have to wait for the request to complete.\n\n";
  
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


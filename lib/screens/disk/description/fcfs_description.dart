import 'package:flutter/material.dart';

class FcfsDescription extends StatelessWidget {
  final s1 ="First Come First Serve (FCFS) is an operating system scheduling algorithm that automatically executes queued requests and processes in order of their arrival. It is the easiest and simplest CPU scheduling algorithm.\n";
     

  final s2 = "In this type of algorithm, processes which requests the CPU first get the CPU allocation first. This is managed with a FIFO queue. The full form of FCFS is First Come First Serve.\n";

  final s3 =
      "It supports non-preemptive and pre-emptive scheduling algorithm.\n\n";
  final s4 =
      "This method is poor in performance, and the general wait time is quite high.\n\n";
  final s5 = "It is a Non-Preemptive CPU scheduling algorithm, so after the process has been allocated to the CPU, it will never release the CPU until it finishes executing.\n\n";
  
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


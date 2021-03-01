import 'package:flutter/material.dart';

class NeuContainer extends StatelessWidget {
   final double boxHeight, boxWidth;
   final boxChild;

   NeuContainer({this.boxHeight, this.boxWidth, this.boxChild});

   
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          width: boxWidth,
          height: boxHeight,
          decoration: BoxDecoration(
            color: Color(0xFFEBEBEB),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(2, 2),
                blurRadius: 3.0,
                spreadRadius: 2.0
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.8),
                offset: Offset(-3, -3),
                blurRadius: 2.0,
                spreadRadius: 1.0
              )
            ]
          ),
          child: boxChild
        ),
      ),
    );
  }
}
import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonMat extends StatelessWidget {

  final double boxHeight, boxWidth;
  final String text;
  final Function pressButton;
  final iconName;
  final textColor;

  ButtonMat(
    {
      this.boxHeight,
      this.boxWidth,
      this.text,
      this.pressButton,
      this.iconName,
      this.textColor
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: boxWidth,
          height: boxHeight,
          decoration: BoxDecoration(
            color: Color(0xFFEFF3F6),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(2, 1),
                blurRadius: 3.0,
                spreadRadius: 2.0
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.9),
                offset: Offset(-3, -3),
                blurRadius: 3.0,
                spreadRadius: 1.0
              )
            ]
          ),
          child: FlatButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconName,
                SizedBox(height: 20),
                Text(
                  "$text",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.bold
                    )
                ),
              ]
            ),
            onPressed: pressButton,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class NeuContainer extends StatelessWidget {
  final double boxHeight, boxWidth;
  final boxChild;
  final boxColor;
  final boxAlignment;
  final bool leftPadding;
  final bool rightPadding;

  NeuContainer(
      {this.boxHeight,
      this.boxWidth,
      this.boxChild,
      this.boxColor,
      this.boxAlignment,
      this.leftPadding,
      this.rightPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: leftPadding == true && leftPadding == rightPadding
            ? EdgeInsets.all(7)
            : leftPadding == true
                ? EdgeInsets.only(top: 7, bottom: 7, left: 7)
                : rightPadding == true
                    ? EdgeInsets.only(top: 7, bottom: 7, right: 7)
                    : EdgeInsets.only(top: 7, bottom: 7),
        child: Container(
            width: boxWidth,
            height: boxHeight == null ? 43 : boxHeight,
            alignment: boxAlignment,
            decoration: BoxDecoration(
                color: boxColor == null ? Color(0xFFEBEBEB) : boxColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x1f000000),
                    offset: Offset(4, 4),
                    blurRadius: 6,
                  ),
                  BoxShadow(
                    color: const Color(0xefffffff),
                    offset: Offset(-4, -4),
                    blurRadius: 6,
                  )
                ]),
            child: boxChild),
      ),
    );
  }
}

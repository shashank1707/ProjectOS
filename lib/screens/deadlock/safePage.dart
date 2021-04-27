import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class SafePage extends StatelessWidget {
  

  final safeSeq;
  SafePage({this.safeSeq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewGradientAppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()),
          title: Text("BANKER'S ALGORITHM"),
          gradient: LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
        ),
        body: Center(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 13,
            ),
            Text(
              "The Safe Sequence For given problem is:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800), textAlign: TextAlign.center,
            ),
            Text(
              "$safeSeq",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800), textAlign: TextAlign.center,
            )
          ]),
        ));
  }
}

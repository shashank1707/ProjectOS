import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class SafePage extends StatelessWidget {
  const SafePage({Key key}) : super(key: key);

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
              //"DEADLOCK!",
              //"The Safe Sequence is: \n\n P1->P5->P2->P4->P3",
              "The Safe Sequence is: \n\n P2->P4->P5->P1->P3",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            )
          ]),
        ));
  }
}

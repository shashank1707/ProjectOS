import 'package:flutter/material.dart';
import './neuCont.dart';

class GantChart extends StatefulWidget {
  @override
  _GantChartState createState() => _GantChartState();
}

class _GantChartState extends State<GantChart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFEBEBEB),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: 25,
              color: Color(0xFF616161),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Gant Chart",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF616161))),
        ),
        body: Center(
          child: Text(
            "Work In Progress",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xff616161),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

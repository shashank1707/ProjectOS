import 'package:flutter/material.dart';


class CpuHome extends StatefulWidget {
  @override
  _CpuHomeState createState() => _CpuHomeState();
}

class _CpuHomeState extends State<CpuHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_rounded, size: 30),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                Text("CPU Scheduling", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFFE03B8B)))
              ],
            )
          ],
        ) 
      )
    );
  }
}
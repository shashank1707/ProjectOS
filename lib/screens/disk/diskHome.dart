import 'package:flutter/material.dart';


class DiskHome extends StatefulWidget {
  @override
  _DiskHomeState createState() => _DiskHomeState();
}

class _DiskHomeState extends State<DiskHome> {
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
                Text("Disk Scheduling", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.cyan))
              ],
            )
          ],
        ) 
      )
    );
  }
}
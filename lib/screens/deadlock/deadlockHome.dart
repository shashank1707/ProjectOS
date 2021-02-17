import 'package:flutter/material.dart';


class DeadlockHome extends StatefulWidget {
  @override
  _DeadlockHomeState createState() => _DeadlockHomeState();
}

class _DeadlockHomeState extends State<DeadlockHome> {
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
                Text("Concurency and Deadlock", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF02B290)))
              ],
            )
          ],
        ) 
      )
    );
  }
}
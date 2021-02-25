import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, size: 30, color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text("Input", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF5DA3FA))),
        ),
        
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
           
          ],
        ) 
      )
    );
  }
}
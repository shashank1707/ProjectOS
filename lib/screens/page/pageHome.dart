import 'package:ProjectOS/screens/page/components/materialButton.dart';
import './infoPage.dart';
import 'package:flutter/material.dart';


class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
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
          title: Text("Page Replacement", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF5DA3FA))),
        ),
        body: Column(
          children: [
            ButtonMat(
              // iconName: Icon(Icons.arrow_circle_up),
              // boxHeight: 100,
              // boxWidth: double.infinity,
              text: "FIFO PRA",
              textColor: Colors.blue,
              pressButton: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPage(algoName : "FIFO PRA")
                ));
              }
            )
          ],
        ) 
      )
    );
  }
}
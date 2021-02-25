import 'package:flutter/material.dart';
import './inputPage.dart';

class InfoPage extends StatefulWidget {

  final String algoName;

  InfoPage({this.algoName});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  final String algoName;

  _InfoPageState({this.algoName});

  String theory;
  
  @override
  void initState() {
    super.initState();
    print(widget.algoName);
    setDetails();
  }

  void setDetails(){
    setState(() {
      if(widget.algoName == "FIFO PRA"){
        theory = 'As the name suggests, this algorithm works on the principle of "First in First out".It replaces the oldest page that has been present in the main memory for the longest time. It is implemented by keeping track of all the pages in a queue.';
      }
    });
  }

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
          title: Text("${widget.algoName}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF5DA3FA))),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InputPage()),
            );
          },
          backgroundColor: Colors.blue,
          label: Text('Go to Input'),
          icon: Icon(Icons.input),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("$theory", style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),

              ),
            ),
           
          ],
        ) 
      )
    );
  }
}
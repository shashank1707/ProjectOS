
import 'package:project_os/screens/page/result.dart';


import './components/neuContainer.dart';
import 'package:flutter/material.dart';


class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {

  var theory = 'The page replacement algorithm decides which memory page is to be replaced. The process of replacement is sometimes called swap out or write to disk. Page replacement is done when the requested page is not found in the main memory (page fault).';
  var title = "Theory";


  var frames = "3";
  var inputString = "1 2 3 4 1 2 5 1 2 3 4 5";

  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFEBEBEB),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, size: 25, color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text("Page Replacement", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF5DA3FA))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

               Column(
                 children: [
                    Text("$title", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff616161)
                      ),

                    ),

                    SizedBox(height: 20),

                    Text("$theory", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff616161)
                      ),
                      textAlign: TextAlign.justify,
                    ),
                 ],
               ),

              Column(
                children: [
                  NeuContainer(
                    boxChild: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Page Sequence (space separated)",
                        hintStyle: TextStyle(color: Color(0xff616161), fontWeight: FontWeight.bold)
                      ),
                      onChanged: (text){
                        setState(() {
                          inputString = text;
                        });
                      },
                    ),
                  ),
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: NeuContainer(
                          boxChild: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Number of Frames",
                              hintStyle: TextStyle(color: Color(0xff616161), fontWeight: FontWeight.bold)
                            ),
                            onChanged: (text){
                              setState(() {
                                frames = text;
                              });
                            },
                          ),
                        ),
                      ),
                      
                      NeuContainer(
                        boxColor: Color(0xff616161),
                        boxChild: IconButton(
                          icon: Icon(Icons.arrow_forward_rounded, color: Color(0xFFEBEBEB),),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ResultPage(
                                frames: frames,
                                inputString: inputString,
                              )
                            ));
                          }
                        ),
                      ),

                    ],
                  ),
                ],
              )
            ],
          ),
        ) 
      )
    );
  }
}
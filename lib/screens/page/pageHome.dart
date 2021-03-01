// import 'package:ProjectOS/screens/page/components/materialButton.dart';
import './components/neuContainer.dart';
import 'package:flutter/material.dart';


class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {

  var theory = 'As the name suggests, this algorithm works on the principle of "First in First out".It replaces the oldest page that has been present in the main memory for the longest time. It is implemented by keeping track of all the pages in a queue.';
  var title = "First in First Out";

  var toDisplay = false;

  var selectedButton = new List.filled(3, false);

  var frames = "3";
  var inputString = "1 2 3 4 2 1";

  var pageHit = 0;
  var pageFault = 0;
  var hitRatio = 0.00;
  var faultRatio = 0.00;
  
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedButton[0] = true;
    });
  }

  void check(index){
    selectedButton = new List.filled(3, false);
    setState(() {
      selectedButton[index] = true;
      if(index == 0){
        theory = 'As the name suggests, this algorithm works on the principle of "First in First out".It replaces the oldest page that has been present in the main memory for the longest time. It is implemented by keeping track of all the pages in a queue.';

        title = "First In First Out";

      }else if(index == 1){
        theory = 'As the name suggests, this algorithm works on the principle of "Least Recently Used". It replaces the page that has not been referred by the CPU for the longest time.';

        title = "Least Recently Used";

      }else if(index == 2){
        theory = 'This algorithm replaces the page that will not be referred by the CPU in future for the longest time. It is practically impossible to implement this algorithm. This is because the pages that will not be used in future for the longest time can not be predicted. However, it is the best known algorithm and gives the least number of page faults. Hence, it is used as a performance measure criterion for other algorithms.';

        title = "Optimal Page Replacement";

      }
    });
  }

  void fifo(){
    var _frames = int.parse(frames);
    var pageList = inputString.split(" ");
    var frameList = new List.filled(_frames, -1);
    int n = pageList.length;
    var _pageFault = 0;
    var _pageHit = 0;

    var index = 0;
    int i = 0;
    for(i = i; i<frameList.length; i++){
      frameList[i] = int.parse(pageList[i]);
      _pageFault++;
    }

    for(i = i; i<n; i++){
      if(!frameList.contains(int.parse(pageList[i]))){
        frameList[index++] = int.parse(pageList[i]);
        _pageFault++;
        if(index >= frameList.length) index = 0;
      }else{
        _pageHit++;
      }
    }


    setState(() {
      pageFault = _pageFault;
      pageHit = _pageHit;
      hitRatio = pageHit/n;
      faultRatio = pageFault/n;
    });

  }

  void lru(){

    var _frames = int.parse(frames);
    var pageList = inputString.split(" ");
    var frameList = new List.filled(_frames, -1);
    int n = pageList.length;

    var _pageFault = 0;
    var _pageHit = 0;
    int i = 0;

    for (i = i; i < frameList.length; i++) {
      frameList[i] = int.parse(pageList[i]);
      _pageFault++;
    }


    for(i=i; i<n; i++){
      if(frameList.contains(int.parse(pageList[i]))){
        _pageHit++;
      }else{

        for(int j=0; j<i; j++){
          if(frameList.contains(int.parse(pageList[j]))){
            bool isFound = false;
            for(int k=j+1; k<i; k++){
              if(pageList[j] == pageList[k]){
                isFound = true;
                break;
              }
            }
            if(!isFound){
              frameList[frameList.indexOf(int.parse(pageList[j]))] = int.parse(pageList[i]);
              _pageFault++;
              break;
            }
          }
        }
      }
    
   }

    setState(() {
      pageFault = _pageFault;
      pageHit = _pageHit;
      hitRatio = pageHit/n;
      faultRatio = pageFault/n;
    });

  }

  void opr(){
    //converting string to int array
    var _frames = int.parse(frames);
    var pageList = inputString.split(" ");
    var frameList = new List.filled(_frames, -1);
    int n = pageList.length;

    var _pageFault = 0;
    var _pageHit = 0;
    int i = 0;

    for (i = i; i < frameList.length; i++) {
      frameList[i] = int.parse(pageList[i]);
      _pageFault++;
    }

    for(i=i; i<n; i++){
      if(frameList.contains(int.parse(pageList[i]))){
        _pageHit++;
      }else{
        bool shouldContinue = false;
        for(int j=0; j<frameList.length; j++){
          bool doesContain = false;
          for(int k=i+1; k<n; k++){
            if(frameList[j] == int.parse(pageList[k])){
              doesContain = true;
              break;
            }
          }
          if(!doesContain){
            frameList[j] = int.parse(pageList[i]);
            shouldContinue = true;
            _pageFault++;
            break;
          }
        }

        if(shouldContinue) continue;

        for(int j=n-1; j>i; j--){
          if(frameList.contains(int.parse(pageList[j]))){
            bool isFound = false;
            for(int k=j-1; k>i; k--){
              if(pageList[j] == pageList[k]){
                isFound = true;
                break;
              }
            }
            if(!isFound){
              frameList[frameList.indexOf(int.parse(pageList[j]))] = int.parse(pageList[i]);
              _pageFault++;
              break;
            }
          }
        }
      }
      
    }

    setState(() {
      pageFault = _pageFault;
      pageHit = _pageHit;
      hitRatio = pageHit/n;
      faultRatio = pageFault/n;
    });

  }

  void calc(){
    if(selectedButton.indexOf(true) == 0){
      fifo();
    }else if(selectedButton.indexOf(true) == 1){
      lru();
    }else if(selectedButton.indexOf(true) == 2){
      opr();
    }
  }

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
                      textAlign: TextAlign.center,
                    ),
                 ],
               ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Page Hit : $pageHit", style: TextStyle(
                          color: Color(0xff007aff),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Hit Ratio : ${hitRatio.toStringAsFixed(2)}", style: TextStyle(
                          color: Color(0xff007aff),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Page Fault : $pageFault", style: TextStyle(
                          color: Color(0xfffc6b4e),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Fault Ratio : ${faultRatio.toStringAsFixed(2)}", style: TextStyle(
                          color: Color(0xfffc6b4e),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )),
                      )
                    ],
                  ),

                  NeuContainer(
                    boxChild: TextField(
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
                  NeuContainer(
                    boxChild: TextField(
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
                      NeuContainer(
                        boxChild: Row(
                          children: [
                            Container(
                              width: 70,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                color: selectedButton[0] ? Color(0xff616161) : Colors.transparent,
                                child: Text("FIFO", style: TextStyle(
                                  color: selectedButton[0] ? Colors.white : Color(0xff616161),
                                ),),
                                onPressed: (){
                                  check(0);
                                }
                              ),
                            ),
                           Container(
                             width: 70,
                             child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                color: selectedButton[1] ? Color(0xff616161) : Colors.transparent,
                                child: Text("LRU", style: TextStyle(
                                  color: selectedButton[1] ? Colors.white : Color(0xff616161),
                                ),),
                                onPressed: (){
                                  check(1);
                                }
                              ),
                           ),
                            Container(
                              width: 70,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                color: selectedButton[2] ? Color(0xff616161) : Colors.transparent,
                                child: Text("OPR", style: TextStyle(
                                  color: selectedButton[2] ? Colors.white : Color(0xff616161),
                                ),),
                                onPressed: (){
                                  check(2);
                                }
                              ),
                            ),
                            
                          ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF616161),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                offset: Offset(2, 2),
                                blurRadius: 3.0,
                                spreadRadius: 2.0
                              ),
                              BoxShadow(
                                color: Colors.white.withOpacity(0.8),
                                offset: Offset(-3, -3),
                                blurRadius: 2.0,
                                spreadRadius: 1.0
                              )
                            ]
                          ),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            // color: Color(0xff616161),
                            child: Text("Calculate", style: TextStyle(color: Colors.white),),
                            onPressed: (){
                              calc();
                            }
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ) 
      )
    );
  }
}
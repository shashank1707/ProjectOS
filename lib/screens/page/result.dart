// import 'package:ProjectOS/screens/page/components/materialButton.dart';
import 'package:ProjectOS/screens/page/anomaly.dart';
import 'package:ProjectOS/screens/page/compare.dart';
import 'package:ProjectOS/screens/page/table.dart';
import './table.dart';

import './components/neuContainer.dart';
import 'package:flutter/material.dart';


class ResultPage extends StatefulWidget {


  final frames;
  final inputString;

  ResultPage({this.frames, this.inputString});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  createDialog(BuildContext context, x){
    return showDialog(context: context, builder: (context){
      if(x == 0){
        return SimpleDialog(
          title: Text("$title", textAlign: TextAlign.center,),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("$theory", style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff616161)
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            
          ],
        );
      }

      return SimpleDialog(
        title: Text("Belady's Anomaly", textAlign: TextAlign.center,),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Bélády’s anomaly is the name given to the phenomenon where increasing the number of page frames results in an increase in the number of page faults for a given memory access pattern. \n\nThis phenomenon is commonly experienced in following page replacement algorithms: \n\n1.First in first out \n2.Second chance algorithm \n3.Random page replacement algorithm", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff616161)
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          
        ],
      );
    });
  }

  var title = "First In First Out";
  var theory = 'As the name suggests, this algorithm works on the principle of "First in First out".It replaces the oldest page that has been present in the main memory for the longest time. It is implemented by keeping track of all the pages in a queue.';

  var selectedButton = new List.filled(3, false);

  var pageHit = 0;
  var pageFault = 0;
  var hitRatio = 0.00;
  var faultRatio = 0.00;

  var fifoData = {"pageHit" : 0, "pageFault" : 0, "hitRatio": 0.00, "faultRatio": 0.00};
  var oprData = {"pageHit" : 0, "pageFault" : 0, "hitRatio": 0.00, "faultRatio": 0.00};
  var lruData = {"pageHit" : 0, "pageFault" : 0, "hitRatio": 0.00, "faultRatio": 0.00};

  var dataTable;
  
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedButton[0] = true;
    });
    calc();
  }

  void check(index){
    selectedButton = new List.filled(3, false);
    setState(() {
      selectedButton[index] = true;
      if(index == 0){
        
        title = "First In First Out";
        theory = 'As the name suggests, this algorithm works on the principle of "First in First out".It replaces the oldest page that has been present in the main memory for the longest time. It is implemented by keeping track of all the pages in a queue.';

      }else if(index == 1){

        title = "Least Recently Used";
        theory = 'As the name suggests, this algorithm works on the principle of "Least Recently Used". It replaces the page that has not been referred by the CPU for the longest time.';

      }else if(index == 2){

        title = "Optimal Page Replacement";
        theory = 'This algorithm replaces the page that will not be referred by the CPU in future for the longest time. It is practically impossible to implement this algorithm. This is because the pages that will not be used in future for the longest time can not be predicted. However, it is the best known algorithm and gives the least number of page faults. Hence, it is used as a performance measure criterion for other algorithms.';

      }
    });
    calc();
  }

  void fifo(){
    var _frames = int.parse(widget.frames);
    var pageList = widget.inputString.split(" ");
    var frameList = new List.filled(_frames, -1);
    int n = pageList.length;
    var _pageFault = 0;
    var _pageHit = 0;
    var _dataTable = new List.filled(n, List.filled(_frames, -1));
    var index = 0;
    int i = 0;

    // for(i = i; i<frameList.length && i<n; i++){
    //   frameList[i] = int.parse(pageList[i]);
    //   _pageFault++;
    //   _dataTable[i] = frameList.toList();
    // }

    for(i = i; i<n; i++){
      if(!frameList.contains(int.parse(pageList[i]))){
        frameList[index++] = int.parse(pageList[i]);
        _pageFault++;
        if(index >= frameList.length) index = 0;
      }else{
        _pageHit++;
      }
      _dataTable[i] = frameList.toList();
    }


    setState(() {
      pageFault = _pageFault;
      pageHit = _pageHit;
      hitRatio = _pageHit/n;
      faultRatio = _pageFault/n;

      fifoData["pageHit"] = _pageHit;
      fifoData["pageFault"] = _pageFault;
      fifoData["hitRatio"] = _pageHit/n;
      fifoData["faultRatio"] = _pageFault/n;
    });
    dataTable = _dataTable;
  }

  void lru(){
    
    var _frames = int.parse(widget.frames);
    var pageList = widget.inputString.split(" ");
    var frameList = new List.filled(_frames, -1);
    int n = pageList.length;
    var _dataTable = new List.filled(n, List.filled(_frames, -1));
    var _pageFault = 0;
    var _pageHit = 0;
    int i = 0;
    int index = 0;

    for (i = i; frameList.contains(-1) && i<n; i++) {


      if(frameList.contains(int.parse(pageList[i]))){
        _pageHit++;
      }else{
        frameList[index++] = int.parse(pageList[i]);
        _pageFault++;
      }

      _dataTable[i] = frameList.toList();
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
      _dataTable[i] = frameList.toList();
    
    }

    dataTable = _dataTable;

    setState(() {
      pageFault = _pageFault;
      pageHit = _pageHit;
      hitRatio = pageHit/n;
      faultRatio = pageFault/n;

      lruData["pageHit"] = _pageHit;
      lruData["pageFault"] = _pageFault;
      lruData["hitRatio"] = _pageHit/n;
      lruData["faultRatio"] = _pageFault/n;
    });

  }

  void opr(){
    //converting string to int array
    var _frames = int.parse(widget.frames);
    var pageList = widget.inputString.split(" ");
    var frameList = new List.filled(_frames, -1);
    int n = pageList.length;
    var _dataTable = new List.filled(n, List.filled(_frames, -1));
    var _pageFault = 0;
    var _pageHit = 0;
    int i = 0;

    // for (i = i; i < frameList.length && i<n; i++) {
    //   frameList[i] = int.parse(pageList[i]);
    //   _pageFault++;
    //   _dataTable[i] = frameList.toList();
    // }

    for(i=i; i<n; i++){
      if(frameList.contains(int.parse(pageList[i]))){
        _pageHit++;
        _dataTable[i] = frameList.toList();
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
            _dataTable[i] = frameList.toList();
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
        _dataTable[i] = frameList.toList();
      }
      
    }
    dataTable = _dataTable;

    setState(() {
      pageFault = _pageFault;
      pageHit = _pageHit;
      hitRatio = pageHit/n;
      faultRatio = pageFault/n;

      oprData["pageHit"] = _pageHit;
      oprData["pageFault"] = _pageFault;
      oprData["hitRatio"] = _pageHit/n;
      oprData["faultRatio"] = _pageFault/n;

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

  void compareAll(){
    
    lru();
    opr();
    fifo();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ComparePage(
          fifoData: fifoData,
          lruData: lruData,
          oprData: oprData,
        )
    ));
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                 Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 30),
                          Text("$title", style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff616161)
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.info_outline_rounded, size: 18, color: Colors.blue,),
                            onPressed: (){
                              createDialog(context, 0);
                            },
                          )
                        ],
                      ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(width: 30),
                         Text("Belady's Anomaly", style: TextStyle(fontSize: 14, color: Colors.black),),
                         IconButton(
                            icon: Icon(Icons.info_outline_rounded, size: 14, color: Colors.blue,),
                            onPressed: (){
                              createDialog(context, 1);
                            },
                          )
                       ],
                     ),
                     Anomaly(inputString: widget.inputString, algo: selectedButton.indexOf(true),)
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
                      boxWidth: double.infinity,
                      boxChild: FlatButton(
                        child: Text("Compare All Algorithms", style: TextStyle(color: Color(0xFF616161), fontWeight: FontWeight.bold, fontSize: 15),),
                        onPressed: (){
                          compareAll();
                        },
                      )
                    ),
                    NeuContainer(
                      boxWidth: double.infinity,
                      boxChild: FlatButton(
                        child: Text("Table", style: TextStyle(color: Color(0xFF616161), fontWeight: FontWeight.bold, fontSize: 15),),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DataGrid(dataTable: dataTable,)
                          ));
                        },
                      )
                    ),
                    NeuContainer(
                      boxChild: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  ],
                )
              ],
            ),
          ),
        ) 
      )
    );
  }
}
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import './safePage.dart';

class BankersAlgoTwo extends StatefulWidget {
  final processNumber;
  final resourceNumber;
  BankersAlgoTwo({this.processNumber, this.resourceNumber});

  @override
  _BankersAlgoTwoState createState() => _BankersAlgoTwoState();
}

class _BankersAlgoTwoState extends State<BankersAlgoTwo> {

  var processList;
  var resourceList;
  var p0 = [], p1 = [], p2 = [], p3 = [], p4 = [];//stores allocated int arrays
  var p0x = [], p1x = [], p2x = [], p3x = [], p4x = [];//stores max int arrays
  var p0allo = "0 0 0 0 0", p1allo = "0 0 0 0 0", p2allo = "0 0 0 0 0", p3allo = "0 0 0 0 0", p4allo = "0 0 0 0 0";//store allocated text arrays
  var p0max = "0 0 0 0 0", p1max = "0 0 0 0 0", p2max = "0 0 0 0 0", p3max = "0 0 0 0 0", p4max = "0 0 0 0";//stores max text arrays
  var avail = [];//store int available array
  var tempavail;//store text available array
  var p0n = [], p1n = [], p2n = [], p3n = [], p4n = [];//stores int value of need array
  var arr = [];

  @override
  void initState() {
    super.initState();
    processList = new List.filled(widget.processNumber, 0);
    resourceList = new List.filled(widget.resourceNumber, 0);
  }


  void logic(){
    p0n = []; p1n = []; p2n = []; p3n = []; p4n = [];
    for(int i=0; i < widget.resourceNumber; i++){
      p0n.add(p0x[i] - p0[i]);  
      p1n.add(p1x[i] - p1[i]); 
      p2n.add(p2x[i] - p2[i]); 
      p3n.add(p3x[i] - p3[i]); 
      p4n.add(p4x[i] - p4[i]); 
    }

    List needmat = [];
    needmat.add(p0n);
    needmat.add(p1n);
    needmat.add(p2n);
    needmat.add(p3n);
    needmat.add(p4n);
    
    List allocmat = [];
    allocmat.add(p0);
    allocmat.add(p1);
    allocmat.add(p2);
    allocmat.add(p3);
    allocmat.add(p4);
    
    var n = widget.processNumber;
    var m = widget.resourceNumber;
    List finish = List.filled(n, 0);
    List answer = List.filled(n, 0);
    var X = 0;
    for (int k = 0; k < 5; k++)
    {
        for (int i = 0; i < n; i++)
        {
            if (finish[i] == 0)
            {

                int flag = 0;// to Flag need > avail condition
                for (int j = 0; j < m; j++)
                {
                    if (needmat[i][j] > avail[j])
                    {
                        flag = 1;
                         break;
                    }
                }

                if (flag == 0)
                {
                    answer[X++] = i;
                    for (int y = 0; y < m; y++)
                    {
                        avail[y] += allocmat[i][y];
                    }
                    finish[i] = 1;
                }
            }
        }
    }
    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SafePage(
                              safeSeq : answer
                            )));
  }

  void pressButton(){
    //Available Resources int conversion
    List temp = tempavail.split(" ");
    temp.forEach((e){
      avail.add(int.parse(e));
    });

    //Allocated Resources int conversion
    temp = p0allo.split(" ");
    temp.forEach((e){
      p0.add(int.parse(e));
    });

    temp = p1allo.split(" ");
    temp.forEach((e){
      p1.add(int.parse(e));
    });

    temp = p2allo.split(" ");
    temp.forEach((e){
      p2.add(int.parse(e));
    });

    temp = p3allo.split(" ");
    temp.forEach((e){
      p3.add(int.parse(e));
    });

    temp = p4allo.split(" ");
    temp.forEach((e){
      p4.add(int.parse(e));
    });

//Max Resources int Conversion
    temp = p0max.split(" ");
    temp.forEach((e){
      p0x.add(int.parse(e));
    });

    temp = p1max.split(" ");
    temp.forEach((e){
      p1x.add(int.parse(e));
    });

    temp = p2max.split(" ");
    temp.forEach((e){
      p2x.add(int.parse(e));
    });

    temp = p3max.split(" ");
    temp.forEach((e){
      p3x.add(int.parse(e));
    });

    temp = p4max.split(" ");
    temp.forEach((e){
      p4x.add(int.parse(e));
    });

    logic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banker's Algorithm"),
      ),
      body: 
      SingleChildScrollView(
              child: Column(
          children: [

            Text("Available Resources"),
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Integer value(Space Seperated)'
                ),
                keyboardType: TextInputType.number,
                onChanged: (text){
                  setState(() {
                    tempavail = text;
                  });
                },
            ),

//-------------------------------------------------------------------------
//        if pr0cess = 2
            if(widget.processNumber == 2) 
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text("Allocated Resources"),
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P0(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p0allo = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P1(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p1allo = text;
                      });
                    },
                ),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Max Resources"),
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P0(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p0max = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P1(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p1max = text;
                      });
                    },
                ),
              ],
            ),
//-------------------------------------------------------------------------
//        if pr0cess = 3
            
            if(widget.processNumber == 3)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Allocated Resources"),
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P0(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p0allo = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P1(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p1allo = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P2(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p2allo = text;
                      });
                    },
                ),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Max Resources"),
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P0(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p0max = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P1(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p1max = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P2(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p2max = text;
                      });
                    },
                ),
              ],
            ),
//-------------------------------------------------------------------------
//        if pr0cess = 4
            if(widget.processNumber == 4)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Allocated Resources"),
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P0(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p0allo = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P1(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p1allo = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P2(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p2allo = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P3(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p3allo = text;
                      });
                    },
                ),

                Text("Max Resources"),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P0(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p0max = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P1(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p1max = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P2(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p2max = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P3(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p3max = text;
                      });
                    },
                ),
              ],
            ),
//-------------------------------------------------------------------------
//        if pr0cess = 5
            if(widget.processNumber == 5)
            Column(
              children: [
                Text("Allocated Resources"),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P0(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p0allo = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P1(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p1allo = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P2(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p2allo = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P3(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p3allo = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P4(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p4allo = text;
                      });
                    },
                ),

                Text("Max Resources"),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P0(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p0max = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P1(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p1max = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P2(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p2max = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P3(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p3max = text;
                      });
                    },
                ),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Integer value for P4(Space Seperated)'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text){
                      setState(() {
                        p4max = text;
                      });
                    },
                ),
              ],
            ),
//--------------------------------------------------------------------------- 

          TextButton(
            onPressed: (){
              pressButton();
            }, 
            child: Text("Next")
          ) 

          ],
        ),
      )
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_os/screens/deadlock/safePage.dart';

class BankersAlgoTwo extends StatefulWidget {
  final processNumber;
  final resourceNumber;
  BankersAlgoTwo({this.processNumber, this.resourceNumber});

  @override
  _BankersAlgoTwoState createState() => _BankersAlgoTwoState();
}

class _BankersAlgoTwoState extends State<BankersAlgoTwo> {
  void checking() {
    for (int i = 0; i < widget.processNumber; i++) {
      for (int j = 0; widget.resourceNumber; j++) {
        setState(() {
          maxAlloc[i][j] = int.parse(pC[i][j].text);
        });
      }
    }
  }

  List pC = <TextEditingController>[];
  List maxAlloc = [];
  List alloc = [];
  var pId = 0;
  var pId2 = 0;
  var rId = 0;

  int i = -1;
  int j = 0;
  List processList = [];
  List resourceList = [];
  @override
  void initState() {
    super.initState();
    processList = new List.filled(widget.processNumber, 0);
    resourceList = new List.filled(widget.resourceNumber, 0);
    maxAlloc = new List.filled(
        widget.processNumber, List.filled(widget.resourceNumber, 0));
    alloc = new List.filled(
        widget.processNumber, List.filled(widget.resourceNumber, 0));
    pC = new List.filled(widget.processNumber,
        List.filled(widget.resourceNumber, TextEditingController()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banker's Algorithm"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
              ),
              Text("Available resources", style: TextStyle(fontSize: 24)),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  children: [
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width / 20,
                    // ),
                    ...(resourceList)
                        .map(
                          (e) => Expanded(
                            child: TextField(
                              //controller: pC[i][j],

                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  //labelText: '$e',
                                  hintText: 'Enter Integer value'),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        )
                        .toList(),
                    //SizedBox(
                    //  width: MediaQuery.of(context).size.width / ,
                    //),
                  ],
                ),
              ),

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
              ),
              Text("Allocated resources", style: TextStyle(fontSize: 24)),
              ...(maxAlloc).asMap().entries.map((e) {
                i++;
                j = -1;

                return Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("P${e.key}"),
                      ),
                      ...(resourceList).asMap().entries.map((f) {
                        j++;
                        print(i.toString() + " " + j.toString());
                        final col = f.key;
                        final row = e.key;
                        return Expanded(
                          child: TextField(
                            //controller: pC[i][j],
                            onChanged: (val) {
                              print(e.key);
                              print(f.key);
                              // setState(() {
                              maxAlloc[row][col] = int.parse(val);
                              print(maxAlloc);
                              // });
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '$col',
                                hintText: 'Enter Integer value'),
                            keyboardType: TextInputType.number,
                          ),
                        );
                      })
                    ],
                  ),
                );
              }).toList(),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
              ),
              Text("Max resource allocation", style: TextStyle(fontSize: 24)),
              ...(maxAlloc).asMap().entries.map((e) {
                i++;
                j = -1;

                return Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("P${e.key}"),
                      ),
                      ...(resourceList).asMap().entries.map((f) {
                        j++;
                        print(i.toString() + " " + j.toString());
                        final col = f.key;
                        final row = e.key;
                        return Expanded(
                          child: TextField(
                            //controller: pC[i][j],
                            onChanged: (val) {
                              print(e.key);
                              print(f.key);
                              // setState(() {
                              maxAlloc[row][col] = int.parse(val);
                              print(maxAlloc);
                              // });
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '$col',
                                hintText: 'Enter Integer value'),
                            keyboardType: TextInputType.number,
                          ),
                        );
                      })
                    ],
                  ),
                );
              }).toList(),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SafePage()));
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

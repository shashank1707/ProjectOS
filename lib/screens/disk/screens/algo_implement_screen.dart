import 'package:project_os/screens/disk/algorithms/clook_algorithm.dart';
import 'package:project_os/screens/disk/algorithms/cscan_algorithm.dart';
import 'package:project_os/screens/disk/algorithms/fcfs_algorithm.dart';
import 'package:project_os/screens/disk/algorithms/look_algorithm.dart';
import 'package:project_os/screens/disk/algorithms/scan_algorithm.dart';
import 'package:project_os/screens/disk/algorithms/sstf_algorithm.dart';
import 'package:project_os/screens/disk/bar_grapgh_syncfusion.dart';
import 'package:project_os/screens/disk/line_graph_os.dart';
import 'package:project_os/screens/disk/screens/algo_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:developer' as logger;

import '../line_graph_syncfusion.dart';

enum Search { left, right }

class AlgoImplementScreen extends StatefulWidget {
  final String text;

  AlgoImplementScreen(this.text);

  @override
  _AlgoImplementScreenState createState() => _AlgoImplementScreenState();
}

class _AlgoImplementScreenState extends State<AlgoImplementScreen> {
  Search _search = Search.left;
  final _form = GlobalKey<FormState>();
  final arrayController = TextEditingController();
  final headController = TextEditingController();
  String direction = 'left';
  bool b = false, compare = false;
  List<int> array = [];
  List<List<int>> arr2 = [];

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: Colors.cyan,
        title: Text(
          widget.text,
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        // backgroundColor: Colors.white,
        actions: [
          if (widget.text != 'Compare')
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                // logger.log('message');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AlgoInfoScreen(widget.text),
                  ),
                );
              },
            ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _form,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Head',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: headController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      hintText: 'Enter the value of head',
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Order of Request',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: arrayController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      hintText: 'Enter the values of the array',
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  if (widget.text == 'SCAN' || widget.text == 'LOOK')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Direction',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'Left',
                            style: TextStyle(color: Colors.white),
                          ),
                          leading: Radio(
                            activeColor: Colors.white,
                            fillColor: MaterialStateProperty.all(Colors.white),
                            // focusColor: Colors.green,
                            value: Search.left,
                            groupValue: _search,
                            onChanged: (Search value) {
                              setState(() {
                                _search = value;
                                direction = 'left';
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'Right',
                            style: TextStyle(color: Colors.white),
                          ),
                          leading: Radio(
                            activeColor: Colors.white,
                            fillColor: MaterialStateProperty.all(Colors.white),
                            value: Search.right,
                            groupValue: _search,
                            onChanged: (Search value) {
                              setState(
                                () {
                                  _search = value;
                                  direction = 'right';
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  if (b)
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Line Chart Visualisation',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        // LineGraphOs(array),
                        // SizedBox(height: 100),

                        LineGraphSyncfusion(array, text: widget.text),
                        SizedBox(height: 10),
                      ],
                    ),
                  if (compare)
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Seek Count Comparision',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        BarGraphSyncfusion(array),
                        SizedBox(height: 10),
                        Text(
                          'Seek Sequence Comparision',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        LineGraphSyncfusion(
                          arr2[0],
                          arr2: arr2[1],
                          arr3: arr2[2],
                          arr4: arr2[3],
                          arr5: arr2[4],
                          arr6: arr2[5],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.black,
        child: Icon(Icons.check),
        onPressed: () {
          FocusScope.of(context).unfocus();
          print('gr;lle');

          showAns();
        },
        // onPressed: showAns,
      ),
    );
  }

  void showAns() {
    logger.log('first');
    if (headController.text.isEmpty || arrayController.text.isEmpty) {
      return;
    }
    logger.log('2nd');
    int head = int.parse(headController.text);
    String arrString = arrayController.text;
    List<String> stringList = arrString.split(' ');
    List<int> arr = stringList.map((e) => int.parse(e)).toList();
    logger.log('3rd');
    List<Object> ans = abc(widget.text, arr: arr, head: head, extra: direction);
    logger.log('4th');
    if (widget.text == 'Compare') {
      logger.log('in compare');
      array = ans[0];
      arr2 = ans[1];
      setState(() {
        compare = true;
      });
      return;
    }
    List<int> ans1 = ans[1] as List<int>;
    logger.log(ans1.toString());
    debugPrint('ggg');
    logger.log('gththt');
    array = [head, ...(ans1)];
    logger.log(array.toString());
    setState(() {
      b = true;
    });
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (ctx) => LineGraphOs(ans[1])));

    // showDialog(
    //   builder: (ctx) {
    //     return AlertDialog(
    //       title: Text('Seek Count: $ans'),
    //       actions: [
    //         FlatButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //               headController.text = '';
    //               arrayController.text = '';
    //               FocusScope.of(context).unfocus();
    //             },
    //             child: Text('Okay'))
    //       ],
    //     );
    //   },
    //   context: context,
    // );
  }

//'FCFS',
//     'SSTF',
//     'SCAN',
//     'CSCAN',
//     'LOOK',
//     'CLOOK',
  List<Object> abc(String algo, {List<int> arr, int head, String extra}) {
    print('abc');
    if (algo == 'SCAN') {
      print(extra);
      return ScanAlgorithm.scan(arr, head, 200, extra);
    } else if (algo == 'FCFS') {
      return FcfsAlgorithm.fcfs(arr, head);
    } else if (algo == 'SSTF') {
      return SstfAlgorithm.sstf(arr, head);
    } else if (algo == 'CSCAN') {
      return CscanAlgorithm.c_scan(arr, head, 200);
    } else if (algo == 'LOOK') {
      return LookAlgorithm.look(arr, head, 200, extra);
    } else if (algo == 'CLOOK') {
      return ClookAlgorithm.clook(arr, head, 200);
    } else {
      List<int> arrayx = [];
      List<List<int>> array2 = [];
      List<Object> temp;
      temp = FcfsAlgorithm.fcfs(arr, head);
      arrayx.add(temp[0]);
      array2.add(temp[1]);
      temp = SstfAlgorithm.sstf(arr, head);
      arrayx.add(temp[0]);
      array2.add(temp[1]);
      temp = ScanAlgorithm.scan(arr, head, 200, direction);
      arrayx.add(temp[0]);
      array2.add(temp[1]);
      temp = CscanAlgorithm.c_scan(arr, head, 200);
      arrayx.add(temp[0]);
      array2.add(temp[1]);
      temp = LookAlgorithm.look(arr, head, 200, direction);
      arrayx.add(temp[0]);
      array2.add(temp[1]);
      temp = ClookAlgorithm.clook(arr, head, 200);
      arrayx.add(temp[0]);
      array2.add(temp[1]);
      return [arrayx, array2];
    }
  }

  static List<charts.Series<LinearSales, int>> _createSampleData(
      List<int> arr) {
    var data = [];
    for (int i = 0; i < arr.length; i++) {
      data.add(LinearSales(arr[i], i + 1));
    }

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.x,
        measureFn: (LinearSales sales, _) => sales.y,
        data: data,
      )
    ];
  }

  @override
  void dispose() {
    headController.dispose();
    arrayController.dispose();
    super.dispose();
  }
}

class LinearSales {
  final int x;
  final int y;

  LinearSales(this.x, this.y);
}

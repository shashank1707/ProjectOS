// import 'package:ProjectOS/screens/page/components/neuContainer.dart';
import 'package:flutter/material.dart';
import './neuCont.dart';
import './experiments.dart';
import './experiments2.dart';
import 'result.dart';

class CPUHome extends StatefulWidget {
  @override
  _CPUHomeState createState() => _CPUHomeState();
}

class _CPUHomeState extends State<CPUHome> {
  var theory =
      'Lorem ipsum dolor sit amet,consectetur adipiscing elit. Vestibulum eget pellentesque diam, in maximus risus. Ut nec vehicula nisl. Nulla ';
  var title = "Theory";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xFFEBEBEB),
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 25,
                  color: Color(0xFF616161),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text("CPU Scheduling",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF616161))),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(19.0, 0, 19.0, 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "$theory",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff616161)),
                        textAlign: TextAlign.justify,
                      ),
                      Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: <DataColumn>[
                                DataColumn(
                                  label: Text('Column 1'),
                                ),
                                DataColumn(
                                  label: Text('Column 2'),
                                ),
                                DataColumn(
                                  label: Text('Column 3'),
                                ),
                                DataColumn(
                                  label: Text('Column 4'),
                                ),
                                DataColumn(
                                  label: Text('Column 5'),
                                ),
                                DataColumn(
                                  label: Text('Column 6'),
                                ),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                    DataCell(Text('Data')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "P0",
                            style: TextStyle(
                                color: Color(0xff616161),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: NeuContainer(
                              rightPadding: true,
                              boxChild: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Arrival Time",
                                    hintStyle: TextStyle(
                                        color: Color(0xff616161),
                                        fontWeight: FontWeight.bold)),
                                onChanged: (text) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: NeuContainer(
                              leftPadding: true,
                              boxChild: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Burst Time",
                                    hintStyle: TextStyle(
                                        color: Color(0xff616161),
                                        fontWeight: FontWeight.bold)),
                                onChanged: (text) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: NeuContainer(
                              boxHeight: 48,
                              rightPadding: true,
                              boxChild: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        color: Color(0xff616161),
                                        child: Text("I/O",
                                            style: TextStyle(
                                                color: Color(0xffebebeb))),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        color: Color(0xffff8822),
                                        child: Text("Non I/O",
                                            style: TextStyle(
                                                color: Color(0xffebebeb))),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          NeuContainer(
                            boxWidth: 90,
                            leftPadding: true,
                            boxColor: Color(0xff616161),
                            boxChild: TextButton(
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      color: Color(0xffebebeb),
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {}),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: NeuContainer(
                              rightPadding: true,
                              boxColor: Color(0xff616161),
                              boxChild: TextButton(
                                  child: Text(
                                    "Non Pre-Emptive",
                                    style: TextStyle(
                                        color: Color(0xffebebeb),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {}),
                            ),
                          ),
                          NeuContainer(
                            leftPadding: true,
                            boxWidth: 130,
                            boxColor: Color(0xff616161),
                            boxChild: TextButton(
                                child: Text(
                                  "Calculate",
                                  style: TextStyle(
                                      color: Color(0xffebebeb),
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Experiment();
                                  }));
                                }),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}

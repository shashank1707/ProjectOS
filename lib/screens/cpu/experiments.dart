import './neuCont.dart';
import 'package:flutter/material.dart';
import './experiments2.dart';

void main() => runApp(Experiment());

class Experiment extends StatefulWidget {
  // const Experiment({Key? key}) : super(key: key);

  // @override
  State<StatefulWidget> createState() => _ExperimentState();
}

class _ExperimentState extends State<Experiment> {
  var theory =
      'Lorem ipsum dolor sit amet,consectetur adipiscing elit. Vestibulum eget pellentesque diam, in maximus risus. Ut nec vehicula nisl. Nulla ';

  List<Color> colors = [Color(0xff616161), Color(0xffebebeb)];

  double height = 203;

  bool isIO = false;

  int ioBg = 0;
  int ioText = 1;

  String bt1 = "";
  String bt2 = "";

  void ioCheck(bool ioChecked) {
    setState(() {
      isIO = ioChecked;
      if (ioChecked) {
        ioBg = 1;
        ioText = 0;
        height = 260;
        bt1 = ' 1ˢᵗ';
        bt2 = ' 2ⁿᵈ';
      } else {
        ioBg = 0;
        ioText = 1;
        height = 203;
        bt1 = "";
        bt2 = "";
      }
    });
  }

  int preEmpText = 1;
  int preEmpBg = 0;

  void preEmpCheck() {
    setState(() {
      int temp = preEmpText;
      preEmpText = preEmpBg;
      preEmpBg = temp;
    });
  }

  TextEditingController arrivalTime = TextEditingController();
  TextEditingController burstTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffebebeb),
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: !isIO ? Text("Hey There") : Container(),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columnSpacing: 12,
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text('Process'),
                              ),
                              DataColumn(
                                label: Text('Arrival Time'),
                              ),
                              DataColumn(
                                label: Text('Burst Time'),
                              ),
                              DataColumn(
                                label: Text('I/O Time'),
                              ),
                              DataColumn(
                                label: Text('2nd Burst Time'),
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
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
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
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
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
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
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
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
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
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
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
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: height,
          padding: EdgeInsets.only(
            left: 10,
            right: 7,
          ),
          child: Column(
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
                            hintText: "Enter Arrival Time",
                            hintStyle: TextStyle(
                                color: Color(0xff616161),
                                fontWeight: FontWeight.w500)),
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
                            hintText: "Enter$bt1 Burst Time",
                            hintStyle: TextStyle(
                                color: Color(0xff616161),
                                fontWeight: FontWeight.w500)),
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
                children: isIO
                    ? [
                        Expanded(
                          child: NeuContainer(
                            rightPadding: true,
                            boxChild: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter I/O Time",
                                  hintStyle: TextStyle(
                                      color: Color(0xff616161),
                                      fontWeight: FontWeight.w500)),
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
                                  hintText: 'Enter$bt2 Burst Time',
                                  hintStyle: TextStyle(
                                      color: Color(0xff616161),
                                      fontWeight: FontWeight.w500)),
                              onChanged: (text) {
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ]
                    : [],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: NeuContainer(
                      // boxHeight: 48,
                      rightPadding: true,
                      boxChild: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: colors[ioText],
                                child: Text("I/O",
                                    style: TextStyle(color: colors[ioBg])),
                                onPressed: () {
                                  ioCheck(true);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: colors[ioBg],
                                child: Text("Non I/O",
                                    style: TextStyle(color: colors[ioText])),
                                onPressed: () {
                                  ioCheck(false);
                                },
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
                    boxColor: colors[0],
                    boxChild: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: colors[1], fontWeight: FontWeight.w500),
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
                      boxColor: colors[preEmpBg],
                      boxChild: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "Non Pre-Emptive",
                            style: TextStyle(
                                color: colors[preEmpText],
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            preEmpCheck();
                          }),
                    ),
                  ),
                  NeuContainer(
                    leftPadding: true,
                    boxWidth: 130,
                    boxColor: colors[0],
                    boxChild: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "Calculate",
                          style: TextStyle(
                              color: colors[1], fontWeight: FontWeight.w500),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Experiment2();
                          }));
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

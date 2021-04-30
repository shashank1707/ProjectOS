// import 'package:ProjectOS/screens/page/components/neuContainer.dart';
// import 'dart:html';

import 'package:flutter/rendering.dart';

import './gantChart.dart';
import 'package:flutter/material.dart';
import './neuCont.dart';
import './algorithms.dart';

class ResultPage extends StatefulWidget {
  final bool isIO;
  final bool isPri;
  final List<Map> dataMap;

  ResultPage({this.isIO, this.isPri, this.dataMap});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<Color> colorChng = [Color(0xff616161), Color(0xffebebeb)];
  bool isPreEmp = false;
  int dropDownValue = 1;

  String algoName;
  String theory;
  int algoNum;

  List<Map<dynamic, dynamic>> calcMap;
  int tq;
  var avgtat;
  var avgwt;

  List<Map> algo = [
    {
      "FCFS": 1,
      "SJF": 2,
      "LJF": 3,
    },
    {
      "SRTF": 1,
      "LRTF": 2,
      "RR": 3,
    },
    {
      "Priority Non Pre-Emptive": 1,
    },
    {
      "Priority Pre-Emptive": 1,
    }
  ];

  int algoSelect() {
    bool isPriority = widget.isPri;
    if (isPriority && isPreEmp) {
      return 3;
    } else if (isPriority && !isPreEmp) {
      return 2;
    } else if (!isPriority && isPreEmp) {
      return 1;
    } else {
      return 0;
    }
  }

  List mapAdder(List<Map> dataMap) {
    List listOfMap = new List(dataMap.length);
    listOfMap =
        dataMap.map((a) => new Map.from(dataMap[a["Process"] - 1])).toList();
    return listOfMap;
  }

  createDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "$theory",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff616161)),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          );
        });
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        setState(() {
          avgCalc(Algorithms.rr(mapAdder(widget.dataMap), tq, false));
          calcMap = Algorithms.rr(mapAdder(widget.dataMap), tq, false);
        });
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Please Enter Time Quantum"),
      content: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: (input) {
          tq = int.parse(input);
        },
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void avgCalc(List<Map> calcMap) {
    avgtat =
        calcMap.map((m) => m['TAT']).reduce((a, b) => a + b) / calcMap.length;
    avgwt =
        calcMap.map((m) => m['WT']).reduce((a, b) => a + b) / calcMap.length;
  }

  void algoChoosen() {
    int listSelected = algoSelect() * 10 + dropDownValue;
    // String algoName;
    switch (listSelected) {
      case 1:
        {
          algoNum = 1;
          algoName = "First Come First Serve";
          theory =
              "First Come First Serve (FCFS) is an operating system scheduling algorithm that automatically executes queued requests and processes in order of their arrival. It is the easiest and simplest CPU scheduling algorithm. In this type of algorithm, processes which requests the CPU first get the CPU allocation first. This is managed with a FIFO queue. The full form of FCFS is First Come First Serve.";
          calcMap = Algorithms.fifo(mapAdder(widget.dataMap), false);
          avgCalc(calcMap);
        }
        break;
      case 2:
        {
          algoNum = 2;
          algoName = "Shortest Job First";
          theory =
              "Shortest Job First (SJF) is an algorithm in which the process having the smallest execution time is chosen for the next execution. This scheduling method can be preemptive or non-preemptive. It significantly reduces the average waiting time for other processes awaiting execution. The full form of SJF is Shortest Job First.";
          calcMap = Algorithms.sjf(mapAdder(widget.dataMap), false);
          avgCalc(calcMap);
        }
        break;
      case 3:
        {
          algoNum = 3;
          algoName = "Longest Job First";
          theory =
              "Longest Job First (LJF) is a non-preemptive scheduling algorithm. This algorithm is based upon the burst time of the processes. The processes are put into the ready queue based on their burst times i.e., in a descending order of the burst times. As the name suggests this algorithm is based upon the fact that the process with the largest burst time is processed first. The burst time of only those processes is considered that have arrived in the system until that time.";
          calcMap = Algorithms.ljf(mapAdder(widget.dataMap), false);
          avgCalc(calcMap);
        }
        break;
      case 11:
        {
          algoNum = 4;
          algoName = "Shortest Remaining Time First";
          theory =
              "In SRTF, the execution of the process can be stopped after certain amount of time. At the arrival of every process, the short term scheduler schedules the process with the least remaining burst time among the list of available processes and the running process.";
          calcMap = Algorithms.srtf(mapAdder(widget.dataMap), false);
          avgCalc(calcMap);
        }
        break;
      case 12:
        {
          algoNum = 5;
          algoName = "Longest Remaining Time First";
          theory =
              "This is a pre-emptive version of Longest Job First (LJF) scheduling algorithm. In this scheduling algorithm, we find the process with the maximum remaining time and then process it. We check for the maximum remaining time after some interval of time(say 1 unit each) to check if another process having more Burst Time arrived up to that time.";
          calcMap = Algorithms.lrtf(mapAdder(widget.dataMap), false);
          avgCalc(calcMap);
        }
        break;
      case 13:
        {
          algoNum = 6;
          algoName = "Round Robin";
          theory =
              "In Round-robin scheduling, each ready task runs turn by turn only in a cyclic queue for a limited time slice. This algorithm also offers starvation free execution of processes.";
          showAlertDialog(context);
        }
        break;
      case 21:
        {
          algoNum = 7;
          algoName = "Priority Non Pre-Emptive";
          theory =
              "Priority Scheduling is a method of scheduling processes that is based on priority. In this algorithm, the scheduler selects the tasks to work as per the priority.The processes with higher priority should be carried out first, whereas jobs with equal priorities are carried out on a round-robin or FCFS basis.";
          calcMap = Algorithms.prior(mapAdder(widget.dataMap), false);
          avgCalc(calcMap);
        }
        break;
      case 31:
        {
          algoNum = 8;
          algoName = "Priority Pre-Emptive";
          theory =
              "Priority Scheduling is a method of scheduling processes that is based on priority. In this algorithm, the scheduler selects the tasks to work as per the priority.The processes with higher priority should be carried out first, whereas jobs with equal priorities are carried out on a round-robin or FCFS basis.";
          calcMap = Algorithms.preEmpPrior(mapAdder(widget.dataMap), false);
          avgCalc(calcMap);
        }
        break;

      default:
        {
          algoName = "Please Select an Algo";
          theory = "You did not select any algorithm.";
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    algoSelect();
    algoChoosen();
  }

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
              title: Text("Result",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF616161))),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(19.0, 0, 19.0, 15),
              child: CustomScrollView(slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        algoName,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF616161)),
                        textAlign: TextAlign.justify,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.info_outline_rounded,
                          size: 20,
                          color: colorChng[0],
                        ),
                        onPressed: () {
                          createDialog(context);
                        },
                      ),
                    ],
                  ),
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
                                  if (widget.isPri)
                                    DataColumn(label: Text("Priority")),
                                  DataColumn(
                                    label: Text('AT'),
                                  ),
                                  DataColumn(
                                    label: Text('BT'),
                                  ),
                                  if (widget.isIO)
                                    DataColumn(label: Text("IOT")),
                                  if (widget.isIO)
                                    DataColumn(label: Text("BT")),
                                  DataColumn(
                                    label: Text('CT'),
                                  ),
                                  DataColumn(
                                    label: Text('TAT'),
                                  ),
                                  DataColumn(
                                    label: Text('WT'),
                                  ),
                                  DataColumn(
                                    label: Text('RT'),
                                  ),
                                ],
                                rows: <DataRow>[
                                  ...(calcMap).map((data) {
                                    return DataRow(cells: <DataCell>[
                                      DataCell(Text('P${data["Process"]}')),
                                      if (widget.isPri)
                                        DataCell(Text('${data['priority']}')),
                                      DataCell(Text('${data["arrivalTime"]}')),
                                      DataCell(Text('${data["burstTime1"]}')),
                                      if (widget.isIO)
                                        DataCell(Text('${data["ioTime"]}')),
                                      if (widget.isIO)
                                        DataCell(Text('${data["burstTime2"]}')),
                                      DataCell(Text('${data["compTime"]}')),
                                      DataCell(Text('${data["TAT"]}')),
                                      DataCell(Text('${data["WT"]}')),
                                      DataCell(Text('${data["RT"]}')),
                                    ]);
                                  }).toList()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Container(
                  height: 170,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Text(
                                "Average Turn Around Time = ${double.parse((avgtat).toStringAsFixed(2))}",
                                style: TextStyle(
                                    color: Color(0xff007AFF),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Text(
                                "Average Waiting Time = ${double.parse((avgwt).toStringAsFixed(2))}",
                                style: TextStyle(
                                    color: Color(0xffFC6B4E),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: NeuContainer(
                              boxColor: Color(0xffebebeb),
                              boxChild: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Theme(
                                  data: ThemeData(
                                    canvasColor: Color(0xffebebeb),
                                  ),
                                  child: DropdownButton<int>(
                                    icon:
                                        Icon(Icons.keyboard_arrow_down_rounded),
                                    iconSize: 24,
                                    elevation: 8,
                                    isExpanded: true,
                                    style: TextStyle(
                                        color: Color(0xff616161),
                                        fontWeight: FontWeight.w500),
                                    underline: Container(),
                                    onChanged: (int newValue) {
                                      setState(() {
                                        dropDownValue = newValue;
                                        algoChoosen();
                                      });
                                    },
                                    items: algo[algoSelect()]
                                        .map((description, value) {
                                          return MapEntry(
                                              description,
                                              DropdownMenuItem<int>(
                                                value: value,
                                                child: Text(description),
                                              ));
                                        })
                                        .values
                                        .toList(),
                                    value: dropDownValue,
                                    // value: dropDownValue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: NeuContainer(
                              boxColor: isPreEmp ? colorChng[0] : colorChng[1],
                              rightPadding: true,
                              boxChild: FlatButton.icon(
                                  icon: Icon(
                                    isPreEmp
                                        ? Icons.check_circle_outline
                                        : Icons.brightness_1_outlined,
                                    color:
                                        isPreEmp ? colorChng[1] : colorChng[0],
                                  ),
                                  label: Text(
                                    "Pre-Emptive",
                                    style: TextStyle(
                                        color: isPreEmp
                                            ? colorChng[1]
                                            : colorChng[0],
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isPreEmp = !isPreEmp;
                                      algoChoosen();
                                    });
                                  }),
                            ),
                          ),
                          Expanded(
                            child: NeuContainer(
                              boxColor: Color(0xff616161),
                              leftPadding: true,
                              boxChild: TextButton(
                                  child: Text(
                                    "Gant Chart",
                                    style: TextStyle(
                                        color: Color(0xffebebeb),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return GantChart(algoNum, algoName,
                                          widget.dataMap, tq);
                                    }));
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))));
  }
}

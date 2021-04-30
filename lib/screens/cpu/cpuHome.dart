// import 'package:ProjectOS/screens/page/components/neuContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'neuCont.dart';
import 'result.dart';

class CPUHome extends StatefulWidget {
  @override
  _CPUHomeState createState() => _CPUHomeState();
}

final controllerAT = TextEditingController();
final controllerBT1 = TextEditingController();
final controllerIOT = TextEditingController();
final controllerBT2 = TextEditingController();
final controllerPR = TextEditingController();

class _CPUHomeState extends State<CPUHome> {
  //variable declaration
  var theory =
      'CPU Scheduling is the process of determining which process will own CPU for execution while another process is on hold. The main task of CPU Scheduling is to make sure that whenever the CPU remains idle, the operating system at least selects one of the process available in the ready queue for execution. The selection process in the memory that are ready for execution.';

  List<Map> dataMap = [];
  int counter = 1;
  int at = 0, btInput1 = 0, ioT = 0, btInput2 = 0, prior;
  List<Color> colors = [Color(0xff616161), Color(0xffebebeb)];
  double height = 203;

  //--Process Adding Function--
  void addData() {
    setState(() {
      dataMap.add({
        "Process": counter++,
        "arrivalTime": at,
        "burstTime1": btInput1,
        "ioTime": ioT,
        "burstTime2": btInput2,
        "priority": prior,
        "completed": false,
        "RT": null,
      });
      controllerAT.text = "";
      at = 0;
      controllerBT1.text = "";
      btInput1 = 0;
      controllerIOT.text = "";
      ioT = 0;
      controllerBT2.text = "";
      btInput2 = 0;
      controllerPR.text = "";
      prior = null;
    });
  }

  //--Process Deletion Function--
  void deleteData() {
    setState(() {
      dataMap.removeLast();
      counter--;
    });
  }

  //--IO fuction
  bool isIO = false;
  int ioBg = 0;
  int ioText = 1;
  String bt1 = "";
  String bt2 = "";

  void ioCheck() {
    setState(() {
      isIO = !isIO;
      if (isIO) {
        priorityChecked ? height = 317 : height = 260;
        ioBg = 1;
        ioText = 0;
        bt1 = ' 1ˢᵗ';
        bt2 = ' 2ⁿᵈ';
      } else {
        priorityChecked ? height = 260 : height = 203;
        ioBg = 0;
        ioText = 1;
        bt1 = "";
        bt2 = "";
      }
    });
  }

  //--priority fuction
  int priorityText = 0;
  int priorityBg = 1;
  bool priorityChecked = false;

  void priorityCheck() {
    setState(() {
      priorityChecked = !priorityChecked;
      if (priorityChecked) {
        isIO ? height = 317 : height = 260;
        priorityText = 1;
        priorityBg = 0;
      } else {
        isIO ? height = 260 : height = 203;
        priorityText = 0;
        priorityBg = 1;
      }
    });
  }

  TextEditingController arrivalTime = TextEditingController();
  TextEditingController burstTime = TextEditingController();

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Oops"),
      content: Text("Please Enter the values."),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Stack(
            children: [
              counter == 1
                  ? Container(
                      alignment: Alignment.topCenter,
                      child: Text("$theory"),
                    )
                  : Container(
                      margin: EdgeInsets.only(bottom: height),
                      alignment: Alignment.topCenter,
                      height: double.infinity,
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
                              if (priorityChecked)
                                DataColumn(label: Text("Priority")),
                              DataColumn(
                                label: Text('Arrival Time'),
                              ),
                              DataColumn(
                                label: Text('$bt1 Burst Time'),
                              ),
                              if (isIO) DataColumn(label: Text("I/O Time")),
                              if (isIO)
                                DataColumn(label: Text("$bt2 Burst Time")),
                            ],
                            rows: <DataRow>[
                              ...(dataMap).map((data) {
                                return DataRow(cells: <DataCell>[
                                  DataCell(Text('P${data["Process"]}')),
                                  if (priorityChecked)
                                    DataCell(Text('${data['priority']}')),
                                  DataCell(Text('${data["arrivalTime"]}')),
                                  DataCell(Text('${data["burstTime1"]}')),
                                  if (isIO) DataCell(Text('${data["ioTime"]}')),
                                  if (isIO)
                                    DataCell(Text('${data["burstTime2"]}')),
                                ]);
                              }).toList()
                            ],
                          ),
                        ),
                      ),
                    ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: height,
                  color: colors[1],
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "P$counter",
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
                                controller: controllerAT,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Arrival Time",
                                    hintStyle: TextStyle(
                                        color: Color(0xff616161),
                                        fontWeight: FontWeight.w500)),
                                onChanged: (text) {
                                  setState(() {
                                    at = int.parse(text);
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: NeuContainer(
                              leftPadding: true,
                              boxChild: TextField(
                                controller: controllerBT1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter$bt1 Burst Time",
                                    hintStyle: TextStyle(
                                        color: Color(0xff616161),
                                        fontWeight: FontWeight.w500)),
                                onChanged: (text) {
                                  setState(() {
                                    btInput1 = int.parse(text);
                                  });
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
                                      controller: controllerIOT,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter I/O Time",
                                          hintStyle: TextStyle(
                                              color: Color(0xff616161),
                                              fontWeight: FontWeight.w500)),
                                      onChanged: (text) {
                                        setState(() {
                                          ioT = int.parse(text);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: NeuContainer(
                                    leftPadding: true,
                                    boxChild: TextField(
                                      controller: controllerBT2,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Enter$bt2 Burst Time',
                                          hintStyle: TextStyle(
                                              color: Color(0xff616161),
                                              fontWeight: FontWeight.w500)),
                                      onChanged: (text) {
                                        setState(() {
                                          btInput2 = int.parse(text);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ]
                            : [],
                      ),
                      Row(
                          children: priorityChecked
                              ? [
                                  Expanded(
                                    child: NeuContainer(
                                      boxChild: TextField(
                                        controller: controllerPR,
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                'Enter Priority (smaller is higher)',
                                            hintStyle: TextStyle(
                                                color: Color(0xff616161),
                                                fontWeight: FontWeight.w500)),
                                        onChanged: (text) {
                                          setState(() {
                                            prior = int.parse(text);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ]
                              : []),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: NeuContainer(
                              // boxHeight: 48,
                              rightPadding: true,
                              boxChild: FlatButton.icon(
                                icon: isIO
                                    ? Icon(Icons.check_circle_outline,
                                        color: colors[1])
                                    : Icon(
                                        Icons.brightness_1_outlined,
                                        color: colors[0],
                                      ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: colors[ioText],
                                label: Text("I/O",
                                    style: TextStyle(color: colors[ioBg])),
                                onPressed: counter == 1
                                    ? () {
                                        ioCheck();
                                      }
                                    : () {},
                              ),
                            ),
                          ),
                          Expanded(
                            child: NeuContainer(
                              rightPadding: true,
                              leftPadding: true,
                              boxColor: Color(0xffe2222B),
                              boxChild: FlatButton.icon(
                                icon: Icon(
                                  Icons.delete_forever_rounded,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                label: Text(
                                  "Delete",
                                  style: TextStyle(
                                      color: colors[1],
                                      fontWeight: FontWeight.w500),
                                ),
                                onPressed: () {
                                  if (counter > 1) deleteData();
                                },
                              ),
                            ),
                          ),
                          NeuContainer(
                            boxWidth: 90,
                            leftPadding: true,
                            boxColor: colors[0],
                            boxChild: FlatButton.icon(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                label: Text(
                                  "Add",
                                  style: TextStyle(
                                      color: colors[1],
                                      fontWeight: FontWeight.w500),
                                ),
                                onPressed: () {
                                  addData();
                                }),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: NeuContainer(
                              rightPadding: true,
                              boxColor: colors[priorityBg],
                              boxChild: FlatButton.icon(
                                  icon: priorityText == 0
                                      ? Icon(
                                          Icons.brightness_1_outlined,
                                          color: colors[0],
                                        )
                                      : Icon(
                                          Icons.check_circle_outline,
                                          color: colors[1],
                                        ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  label: Text(
                                    "Priority",
                                    style: TextStyle(
                                        color: colors[priorityText],
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: counter == 1
                                      ? () {
                                          priorityCheck();
                                        }
                                      : () {}),
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
                                      color: colors[1],
                                      fontWeight: FontWeight.w500),
                                ),
                                onPressed: counter == 1
                                    ? () {
                                        showAlertDialog(context);
                                      }
                                    : () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return ResultPage(
                                            isIO: isIO,
                                            isPri: priorityChecked,
                                            dataMap: dataMap,
                                          );
                                        }));
                                      }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

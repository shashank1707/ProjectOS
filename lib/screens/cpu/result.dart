// import 'package:ProjectOS/screens/page/components/neuContainer.dart';
import './gantChart.dart';
import 'package:flutter/material.dart';
import './neuCont.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String dropdownValue = 'One';

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "First Come First Serve",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF616161)),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Text("Average Turn Around Time = ",
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
                            child: Text("Average Waiting Time = ",
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
                                  child: DropdownButton<String>(
                                    value: dropdownValue,
                                    icon:
                                        Icon(Icons.keyboard_arrow_down_rounded),
                                    iconSize: 24,
                                    elevation: 8,
                                    isExpanded: true,
                                    style: TextStyle(
                                        color: Color(0xff616161),
                                        fontWeight: FontWeight.w500),
                                    underline: Container(),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropdownValue = newValue;
                                      });
                                    },
                                    items: <String>[
                                      'One',
                                      'Two',
                                      'Free',
                                      'Four'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
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
                              boxColor: Color(0xff616161),
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
                                      return GantChart();
                                    }));
                                  }),
                            ),
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

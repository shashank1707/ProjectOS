import 'package:flutter/material.dart';
import './neuCont.dart';
import './algorithms.dart';

class GantChart extends StatefulWidget {
  final int algo;
  final int tq;
  final List<Map> dataMap;
  final String algoName;

  GantChart(this.algo, this.algoName, this.dataMap, this.tq);

  @override
  _GantChartState createState() => _GantChartState();
}

class _GantChartState extends State<GantChart> {
  List mapAdder(List<Map> dataMap) {
    List listOfMap = new List(dataMap.length);
    listOfMap =
        dataMap.map((a) => new Map.from(dataMap[a["Process"] - 1])).toList();
    return listOfMap;
  }

  List algoChoosen(int x) {
    List chart;
    switch (x) {
      case 1:
        {
          chart = Algorithms.fifo(mapAdder(widget.dataMap), true);
        }
        break;
      case 2:
        {
          chart = Algorithms.sjf(mapAdder(widget.dataMap), true);
        }
        break;
      case 3:
        {
          chart = Algorithms.ljf(mapAdder(widget.dataMap), true);
        }
        break;
      case 4:
        {
          chart = Algorithms.srtf(mapAdder(widget.dataMap), true);
        }
        break;
      case 5:
        {
          chart = Algorithms.lrtf(mapAdder(widget.dataMap), true);
        }
        break;
      case 6:
        {
          chart = Algorithms.rr(mapAdder(widget.dataMap), widget.tq, true);
        }
        break;
      case 7:
        {
          chart = Algorithms.prior(mapAdder(widget.dataMap), true);
        }
        break;
      case 8:
        {
          chart = Algorithms.preEmpPrior(mapAdder(widget.dataMap), true);
        }
        break;

      default:
        {
          chart = Algorithms.fifo(mapAdder(widget.dataMap), true);
        }
        break;
    }
    return chart;
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
          title: Text("${widget.algoName}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF616161))),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ...(algoChoosen(widget.algo)).map((e) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x3f000000),
                            offset: Offset(4, 4),
                            blurRadius: 6,
                          ),
                          BoxShadow(
                            color: const Color(0xffffffff),
                            offset: Offset(-4, -4),
                            blurRadius: 6,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text("Process No. : ${e["Process"]}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                    "Arrival Time : ${e["arrivalTime"]}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(46, 2, 2, 2),
                                child: Text("Burst Time : ${e["burstTime"]}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                    "Starting Time : ${int.parse(e["initTime"].toString())}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(34, 2, 2, 2),
                                child: Text("End Time : ${e["endTime"]}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList()
            ],
          ),
        ),
      ),
    );
  }
}

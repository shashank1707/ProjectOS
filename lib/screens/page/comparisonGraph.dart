import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ComparisonGraph extends StatefulWidget {

  final Map fifoData, lruData, oprData, lifoData;

  ComparisonGraph({this.fifoData, this.lruData, this.oprData, this.lifoData});

  @override
  _ComparisonGraphState createState() => _ComparisonGraphState();
}

class _ComparisonGraphState extends State<ComparisonGraph> {
  final Color leftBarColor = const Color(0xff007aff);

  final Color rightBarColor = const Color(0xfffc6b4e);

  final double width = 10;

  Map _fifoData = {"pageHit" : 0, "pageFault" : 0, "hitRatio": 0.00, "faultRatio": 0.00};
  Map _oprData = {"pageHit" : 0, "pageFault" : 0, "hitRatio": 0.00, "faultRatio": 0.00};
  Map _lruData = {"pageHit" : 0, "pageFault" : 0, "hitRatio": 0.00, "faultRatio": 0.00};
  Map _lifoData = {"pageHit" : 0, "pageFault" : 0, "hitRatio": 0.00, "faultRatio": 0.00};

  void initState(){
    super.initState();
    graphAnimate();
  }

  void graphAnimate() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _fifoData = widget.fifoData;

    });
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      _lruData = widget.lruData;

    });
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      _oprData = widget.oprData;

    });
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      _lifoData = widget.lifoData;

    });
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [leftBarColor],
        width: width,
      ),
      BarChartRodData(
        y: y2,
        colors: [rightBarColor],
        width: width,
      ),
    ]);
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
          title: Text("Graph", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF5DA3FA))),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BarChart(
                BarChartData(
                  maxY: 1.2,
                  alignment: BarChartAlignment.spaceBetween,
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (value) => const TextStyle(
                          color: Color(0xff000000), fontWeight: FontWeight.bold, fontSize: 14),
                      margin: 20,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'FIFO';
                          case 1:
                            return 'LRU';
                          case 2:
                            return 'OPR';
                          case 3:
                            return 'LIFO';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (value) => const TextStyle(
                          color: Color(0xff000000), fontWeight: FontWeight.bold, fontSize: 14),
                      margin: 32,
                      reservedSize: 14,
                      interval: 0.2
                    ),
                  ),
                  barGroups: [
                    makeGroupData(0, _fifoData["hitRatio"], _fifoData["faultRatio"]),
                    makeGroupData(1, _lruData["hitRatio"], _lruData["faultRatio"]),
                    makeGroupData(2, _oprData["hitRatio"], _oprData["faultRatio"]),
                    makeGroupData(3, _lifoData["hitRatio"], _lifoData["faultRatio"]),
                  ],
                  borderData: FlBorderData(
                    show: false,
                    
                  ),
                  axisTitleData: FlAxisTitleData(
                    leftTitle: AxisTitle(
                      margin: 20,
                      showTitle: true,
                      titleText: 'Ratio',
                      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)
                    ),
                    bottomTitle: AxisTitle(
                      showTitle: true,
                      titleText: 'Algorithm',
                      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)
                    )
                  )
                )
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, color: Color(0xff007aff), size: 15,),
                      SizedBox(width: 15),
                      Text("Hit Ratio", style: TextStyle(color: Color(0xff007aff), fontWeight: FontWeight.bold, fontSize: 16), )
                    ]
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Color(0xfffc6b4e), size: 15,),
                      SizedBox(width: 15),
                      Text("Fault Ratio", style: TextStyle(color: Color(0xfffc6b4e), fontWeight: FontWeight.bold, fontSize: 16),)
                    ]
                  ),
                ]
              )
            ],
          )
        )
      ),
    );
  }
}
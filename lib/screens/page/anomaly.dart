import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Anomaly extends StatefulWidget {

  final inputString;
  final algo;
  Anomaly({this.inputString, this.algo});

  @override
  _AnomalyState createState() => _AnomalyState();
}

class _AnomalyState extends State<Anomaly> {

  

  double fifo(_frames){

    var pageList = widget.inputString.split(" ");
    var frameList = new List.filled(_frames, -1);
    int n = pageList.length;
    var _pageFault = 0;
    var index = 0;
    int i = 0;
    // for(i = i; i<frameList.length && i<n; i++){
    //   frameList[i] = int.parse(pageList[i]);
    //   _pageFault++;
    // }

    for(i = i; i<n; i++){
      if(!frameList.contains(int.parse(pageList[i]))){
        frameList[index++] = int.parse(pageList[i]);
        _pageFault++;
        if(index >= frameList.length) index = 0;
      }
    }
    return _pageFault/n;
  }



  double lru(_frames){
    
    var pageList = widget.inputString.split(" ");
    var frameList = new List.filled(_frames, -1);
    int n = pageList.length;
    var _pageFault = 0;
    int i = 0;

    int index = 0;

    for (i = i; frameList.contains(-1) && i<n; i++) {


      if(frameList.contains(int.parse(pageList[i]))){
      }else{
        frameList[index++] = int.parse(pageList[i]);
        _pageFault++;
      }

    }


    for(i=i; i<n; i++){
      if(frameList.contains(int.parse(pageList[i]))){
        // print(" ");
      }else{

        for(int j=0; j<i; j++){
          if(frameList.contains(int.parse(pageList[j]))){
            bool isFound = false;
            for(int k=j+1; k<i; k++){
              if(pageList[j] == pageList[k]){
                isFound = true;
                break;
              }
            }
            if(!isFound){
              frameList[frameList.indexOf(int.parse(pageList[j]))] = int.parse(pageList[i]);
              _pageFault++;
              break;
            }
          }
        }
      }
    
    }

    return _pageFault/n;

  }


  double opr(_frames){
    //converting string to int array
    var pageList = widget.inputString.split(" ");
    var frameList = new List.filled(_frames, -1);
    int n = pageList.length;
    var _pageFault = 0;
    int i = 0;

    // for (i = i; i < frameList.length && i<n; i++) {
    //   frameList[i] = int.parse(pageList[i]);
    //   _pageFault++;
    // }

    for(i=i; i<n; i++){
      if(frameList.contains(int.parse(pageList[i]))){
        print("");
      }else{
        bool shouldContinue = false;
        for(int j=0; j<frameList.length; j++){
          bool doesContain = false;
          for(int k=i+1; k<n; k++){
            if(frameList[j] == int.parse(pageList[k])){
              doesContain = true;
              break;
            }
          }
          if(!doesContain){
            frameList[j] = int.parse(pageList[i]);
            shouldContinue = true;
            _pageFault++;
            break;
          }
        }

        if(shouldContinue) continue;

        for(int j=n-1; j>i; j--){
          if(frameList.contains(int.parse(pageList[j]))){
            bool isFound = false;
            for(int k=j-1; k>i; k--){
              if(pageList[j] == pageList[k]){
                isFound = true;
                break;
              }
            }
            if(!isFound){
              frameList[frameList.indexOf(int.parse(pageList[j]))] = int.parse(pageList[i]);
              _pageFault++;
              break;
            }
          }
        }
      }
      
    }

    return _pageFault/n;
    
  }

  double whichAlgo(_frames){
    if(widget.algo == 0){
      return fifo(_frames);
    }else if(widget.algo == 1){
      return lru(_frames);
    }else if(widget.algo == 2){
      return opr(_frames);
    }

    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20, top: 10),
          child: LineChart(
            LineChartData(
              minY: 0.0,
              maxY: 1.2,
              minX: 0,
              maxX: 10,
              borderData: FlBorderData(
                show: true,
                border: Border.all(),
              ),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                show: true,
                leftTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => const TextStyle(
                      color: Color(0xff000000), fontWeight: FontWeight.bold, fontSize: 12),
                  margin: 20,
                  reservedSize: 14,
                  interval: 0.2
                ),

                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => const TextStyle(
                      color: Color(0xff000000), fontWeight: FontWeight.bold, fontSize: 12),
                  margin: 20,
                  reservedSize: 14,
                  interval: 2
                ),
              ),
              axisTitleData: FlAxisTitleData(
                leftTitle: AxisTitle(
                  margin: 20,
                  showTitle: true,
                  titleText: 'Fault Ratio',
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black)
                ),
                bottomTitle: AxisTitle(
                  showTitle: true,
                  margin: 10,
                  titleText: 'Number of Frames',
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black)
                ),
                // topTitle: AxisTitle(
                //   showTitle: true,
                //   margin: 10,
                //   titleText: 'Belady\'s Anomaly',
                //   textStyle: TextStyle(fontSize: 12, color: Colors.black),
                // )
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 1),
                    FlSpot(1, whichAlgo(1)),
                    FlSpot(2, whichAlgo(2)),
                    FlSpot(3, whichAlgo(3)),
                    FlSpot(4, whichAlgo(4)),
                    FlSpot(5, whichAlgo(5)),
                    FlSpot(6, whichAlgo(6)),
                    FlSpot(7, whichAlgo(7)),
                    FlSpot(8, whichAlgo(8)),
                    FlSpot(9, whichAlgo(9)),
                    FlSpot(10, whichAlgo(10)),
                    // FlSpot(11, whichAlgo(11)),
                    // FlSpot(12, whichAlgo(12)),
                    // FlSpot(13, whichAlgo(13)),
                    // FlSpot(14, whichAlgo(14)),
                    // FlSpot(15, whichAlgo(15)),
                    // FlSpot(16, whichAlgo(16)),
                    // FlSpot(17, whichAlgo(17)),
                    // FlSpot(18, whichAlgo(18)),
                    // FlSpot(19, whichAlgo(19)),
                    // FlSpot(20, whichAlgo(20)),
                  ],
                  colors: [Color(0xfffc6b4e)],
                  isCurved: true,
                  curveSmoothness: 0.2,
                  barWidth: 4,
                  // isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: false,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    colors: [Color(0xffebebeb), Color(0xfffc6b4e).withOpacity(0.3)],
                    gradientFrom: Offset(0.5, 1),
                    gradientTo: Offset(0.5, 0)
                  ),
                ),
              ],

            ),
          )
        );
  }
}
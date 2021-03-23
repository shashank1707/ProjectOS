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

  var fifoDataList;
  var lruDataList;
  var oprDataList;
  var lifoDataList;

  void initState(){
    super.initState();
    setListData();
  }

  setListData(){
    setState(() {
      fifoDataList = [fifo(1), fifo(2), fifo(3), fifo(4), fifo(5), fifo(6), fifo(7), fifo(8), fifo(9), fifo(10)];
      lifoDataList = [lifo(1), lifo(2), lifo(3), lifo(4), lifo(5), lifo(6), lifo(7), lifo(8), lifo(9), lifo(10)];
      lruDataList = [lru(1), lru(2), lru(3), lru(4), lru(5), lru(6), lru(7), lru(8), lru(9), lru(10)];
      oprDataList = [opr(1), opr(2), opr(3), opr(4), opr(5), opr(6), opr(7), opr(8), opr(9), opr(10)];
    });
  }

  

  double fifo(_frames){

    var pageList = widget.inputString.split(" ");
    var frameList = new List.filled(_frames, -1);
    int n = pageList.length;
    var _pageFault = 0;
    var index = 0;
    int i = 0;

    for(i = i; i<n; i++){
      if(!frameList.contains(int.parse(pageList[i]))){
        frameList[index++] = int.parse(pageList[i]);
        _pageFault++;
        if(index >= frameList.length) index = 0;
      }
    }
    return _pageFault/n;
  }


  double lifo(_frames){  
    var pageList = widget.inputString.split(" ");
    var frameList = new List.filled(_frames, -1);
    int n = pageList.length;
    var _pageFault = 0;
    var index = 0;
    int i = 0;


    for(i = i; i<n; i++){
      if(!frameList.contains(int.parse(pageList[i]))){
        frameList[index] = int.parse(pageList[i]);
        _pageFault++;
        if(index != frameList.length-1) index++;
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
    var pageList = widget.inputString.split(" ");
    var frameList = new List.filled(_frames, -1);
    int n = pageList.length;
    var _pageFault = 0;
    int i = 0;


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
      return fifoDataList[_frames - 1];
    }else if(widget.algo == 1){
      return lruDataList[_frames - 1];
    }else if(widget.algo == 2){
      return oprDataList[_frames - 1];
    }else if(widget.algo == 3){
      return lifoDataList[_frames - 1];
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
                    FlSpot(10, whichAlgo(10))
                  ],
                  colors: [Color(0xfffc6b4e)],
                  isCurved: true,
                  curveSmoothness: 0.2,
                  barWidth: 4,
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
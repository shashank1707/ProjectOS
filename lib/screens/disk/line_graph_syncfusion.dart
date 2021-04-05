import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineGraphSyncfusion extends StatelessWidget {
  bool boolean = false;
  List<int> arr = [];
  List<int> arr2 = [];
  List<int> arr3 = [];
  List<int> arr4 = [];
  List<int> arr5 = [];
  List<int> arr6 = [];
  String text;

  // Initialized the global variable
  ChartSeriesController _chartSeriesController;
  ChartSeriesController _chartSeriesController2;
  ChartSeriesController _chartSeriesController3;
  ChartSeriesController _chartSeriesController4;
  ChartSeriesController _chartSeriesController5;
  ChartSeriesController _chartSeriesController6;

  LineGraphSyncfusion(
    this.arr, {
      this.text,
    this.arr2,
    this.arr3,
    this.arr4,
    this.arr5,
    this.arr6,
  });

  @override
  Widget build(BuildContext context) {
    log('arr6');
    log(arr6.toString());
    if (arr6 != null) {
      boolean = true;
    }
    log(arr.toString());
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 300,
            child: SfCartesianChart(
              // title: ChartTitle(text: 'Line Graph Visualisation'),
              // Initialize category axis
              primaryYAxis:
                  NumericAxis(labelStyle: TextStyle(color: Colors.white)),
              primaryXAxis: NumericAxis(
                isVisible: false,
                // title: AxisTitle(text: 'Order of request')
              ),

              legend: Legend(
                isVisible: true,
                textStyle: TextStyle(color: Colors.white),
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              // onRendererCreated: (ChartSeriesController controller){
              //   _chartSeriesController = controller;
              // },
              series: <LineSeries<LinearSales, int>>[
                LineSeries<LinearSales, int>(
                  name: text == null? 'FCFS' : text,
                  markerSettings: MarkerSettings(
                      isVisible: true, shape: DataMarkerType.circle),
                  color: Colors.cyan,
                  isVisible: true,
                  animationDuration: 5000,
                  onRendererCreated: (ChartSeriesController controller) {
                    _chartSeriesController = controller;
                  },
                  // Bind data source
                  dataSource: _createSampleData(arr),
                  //   dataSource: <LinearSales>[
                  //     LinearSales(35,0),
                  //     LinearSales(28,1),
                  //     LinearSales(34,2),
                  //     LinearSales(32,3),
                  //     LinearSales(40,4)
                  //   ],
                  xValueMapper: (LinearSales sales, _) => sales.x,
                  yValueMapper: (LinearSales sales, _) => sales.y,
                  dataLabelSettings: DataLabelSettings(
                      isVisible: !boolean, color: Colors.white),
                ),
                if (boolean)
                LineSeries<LinearSales, int>(
                  name: 'SSTF',
                  markerSettings: MarkerSettings(
                      isVisible: true, shape: DataMarkerType.circle),
                  color: Colors.red,
                  isVisible: true,
                  animationDuration: 5000,
                  onRendererCreated: (ChartSeriesController controller) {
                    _chartSeriesController2 = controller;
                  },
                  // Bind data source
                  dataSource: _createSampleData(arr2),
                  xValueMapper: (LinearSales sales, _) => sales.x,
                  yValueMapper: (LinearSales sales, _) => sales.y,
                  // dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
                if (boolean)
                LineSeries<LinearSales, int>(
                  name: 'SCAN',
                  markerSettings: MarkerSettings(
                      isVisible: true, shape: DataMarkerType.circle),
                  color: Colors.purple,
                  isVisible: true,
                  animationDuration: 5000,
                  onRendererCreated: (ChartSeriesController controller) {
                    _chartSeriesController3 = controller;
                  },
                  // Bind data source
                  dataSource: _createSampleData(arr3),
                  xValueMapper: (LinearSales sales, _) => sales.x,
                  yValueMapper: (LinearSales sales, _) => sales.y,
                  // dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
                if (boolean)
                LineSeries<LinearSales, int>(
                  name: 'CSCAN',
                  markerSettings: MarkerSettings(
                      isVisible: true, shape: DataMarkerType.circle),
                  color: Colors.green,
                  isVisible: true,
                  animationDuration: 5000,
                  onRendererCreated: (ChartSeriesController controller) {
                    _chartSeriesController4 = controller;
                  },
                  // Bind data source
                  dataSource: _createSampleData(arr4),
                  xValueMapper: (LinearSales sales, _) => sales.x,
                  yValueMapper: (LinearSales sales, _) => sales.y,
                  // dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
                if (boolean)
                LineSeries<LinearSales, int>(
                  name: 'LOOK',
                  markerSettings: MarkerSettings(
                      isVisible: true, shape: DataMarkerType.circle),
                  color: Colors.teal,
                  isVisible: true,
                  animationDuration: 5000,
                  onRendererCreated: (ChartSeriesController controller) {
                    _chartSeriesController5 = controller;
                  },
                  dataSource: _createSampleData(arr5),
                  xValueMapper: (LinearSales sales, _) => sales.x,
                  yValueMapper: (LinearSales sales, _) => sales.y,
                  // dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
                if (boolean)
                LineSeries<LinearSales, int>(
                  name: 'CLOOK',
                  markerSettings: MarkerSettings(
                      isVisible: true, shape: DataMarkerType.circle),
                  color: Colors.orange,
                  isVisible: true,
                  animationDuration: 5000,
                  onRendererCreated: (ChartSeriesController controller) {
                    _chartSeriesController6 = controller;
                  },
                  dataSource: _createSampleData(arr6),
                  xValueMapper: (LinearSales sales, _) => sales.x,
                  yValueMapper: (LinearSales sales, _) => sales.y,
                  // dataLabelSettings: DataLabelSettings(isVisible: true),
                )
              ],
            ),
          ),
          Text(
            'Order of request',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _chartSeriesController?.animate();
              if (boolean) {
                _chartSeriesController2?.animate();
                _chartSeriesController3?.animate();
                _chartSeriesController4?.animate();
                _chartSeriesController5?.animate();
                _chartSeriesController6?.animate();
              }
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.cyan, onPrimary: Colors.black),
            child: Text('View Animation'),
          ),
        ],
      ),
    );
  }

  List<LinearSales> _createSampleData(List<int> list) {
    List<LinearSales> data = [];
    log('here here');
    log(list.toString());
    if (list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        data.add(LinearSales(list[i], (i + 1)));
      }
    }

    return data;
    // final data = [
    //   new LinearSales(0, 5),
    //   new LinearSales(1, 25),
    //   new LinearSales(2, 100),
    //   new LinearSales(3, 75),
    // ];

    // return [
    //   new LineSeries<LinearSales, int>(
    //     id: 'Sales',
    //     domainFn: (LinearSales sales, _) => sales.x,
    //     measureFn: (LinearSales sales, _) => sales.y,
    //     data: data,
    //   )
    // ];
  }
}

class LinearSales {
  final int x;
  final int y;

  LinearSales(this.y, this.x);
}

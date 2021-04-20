import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraphSyncfusion extends StatelessWidget {
  final List<int> arr;
  final List<String> arr2 = ['FCFS', 'SSTF', 'SCAN', 'CSCAN', 'LOOK', 'CLOOK'];

  BarGraphSyncfusion(this.arr);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(labelStyle: TextStyle(color: Colors.white)),
              primaryYAxis: NumericAxis(labelStyle: TextStyle(color: Colors.white)),
              series: <ChartSeries>[
                // Renders column chart
                ColumnSeries<LinearSales, String>(
                  dataLabelSettings: DataLabelSettings(isVisible: true, color: Colors.white),
                  color: Colors.cyan,
                  dataSource: chartData(),
                  xValueMapper: (LinearSales sales, _) => sales.x,
                  yValueMapper: (LinearSales sales, _) => sales.y,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<LinearSales> chartData() {
    List<LinearSales> data = [];
    for (int i = 0; i < arr.length; i++) {
      data.add(LinearSales(arr[i], arr2[i]));
    }
    return data;
  }
}

class LinearSales {
  final String x;
  final int y;
  LinearSales(this.y, this.x);
}

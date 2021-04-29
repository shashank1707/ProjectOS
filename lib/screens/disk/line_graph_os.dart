import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

class LineGraphOs extends StatelessWidget {
  // final List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;
  final List<int> arr;

  LineGraphOs(this.arr);

  // factory LineGraphOs.withSampleData() {
  //   return new LineGraphOs(
  //     ,
  //     // Disable animations for image tests.
  //     animate: false,
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: new charts.LineChart(
          _createSampleData(),
          animationDuration: Duration(seconds: 2),
          // flipVerticalAxis: true,
          defaultRenderer: charts.LineRendererConfig(includePoints: true),
          animate: animate,
          // Configures four [ChartTitle] behaviors to render titles in each chart
          // margin. The top title has a sub-title, and is aligned to the left edge
          // of the chart. The other titles are aligned with the middle of the draw
          // area.
          behaviors: [
            // new charts.ChartTitle('Line Chart Visualization',
            //     // subTitle: 'Top sub-title text',
            //     behaviorPosition: charts.BehaviorPosition.top,
            //     titleOutsideJustification: charts.OutsideJustification.start,
            //     // Set a larger inner padding than the default (10) to avoid
            //     // rendering the text too close to the top measure axis tick label.
            //     // The top tick label may extend upwards into the top margin region
            //     // if it is located at the top of the draw area.
            //     innerPadding: 18),
            new charts.ChartTitle('Track Number',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
            new charts.ChartTitle('Start title',
                behaviorPosition: charts.BehaviorPosition.start,
                titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
            new charts.ChartTitle('End title',
                behaviorPosition: charts.BehaviorPosition.end,
                titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
          ],
        ),
      );
  }

   List<charts.Series<LinearSales, int>> _createSampleData() {
    List<LinearSales> data = [];
    for (int i=0; i<arr.length; i++){
      data.add(LinearSales(arr[i], (i+1)));
    }
    // final data = [
    //   new LinearSales(0, 5),
    //   new LinearSales(1, 25),
    //   new LinearSales(2, 100),
    //   new LinearSales(3, 75),
    // ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.x,
        measureFn: (LinearSales sales, _) => sales.y,
        data: data,
      )
    ];
  }

}


class LinearSales {
  final int x;
  final int y;

  LinearSales(this.x, this.y);
}

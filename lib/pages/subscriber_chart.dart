import 'package:flutter/material.dart';
import 'package:world_time/pages/subscriber_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SubscriberChart extends StatelessWidget {
  final List<SubscriberSeries> data;

  SubscriberChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
        id: "subscribers",
        data: data,
        domainFn: (SubscriberSeries series, _) => series.year,
        measureFn: (SubscriberSeries series, _) => series.subscribers,
        colorFn: (SubscriberSeries series, _) => series.barColor,
      )
    ];
    return Container(
      // height: 400,
      padding: EdgeInsets.all(20),
      // child: Row(
      //   children: <Widget>[
      //     Text('data')
      //   ],
      // ),

      child: Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: charts.BarChart(
                series,
                animate: true,
              ),
            ),
            // SizedBox(height: 20.0,),
            Text(
              "Simple chart 1",
              style: Theme.of(context).textTheme.body2,
            ),
            Expanded(
              child: charts.PieChart(
                series,
                animate: true,
              ),
            ),
            Text(
              "Simple chart 2",
              style: Theme.of(context).textTheme.body2,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:world_time/pages/subscriber_chart.dart';
import 'package:world_time/pages/subscriber_series.dart';

class SimpleChart extends StatelessWidget {

  final List<SubscriberSeries> data = [
    SubscriberSeries(
      year: "2008",
      subscribers: 100,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
        SubscriberSeries(
      year: "2009",
      subscribers: 120,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
        SubscriberSeries(
      year: "2010",
      subscribers: 150,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
        SubscriberSeries(
      year: "2011",
      subscribers: 90,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
        SubscriberSeries(
      year: "2013",
      subscribers: 70,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Simple Chart'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SubscriberChart(data : data),
      ),
    );
  }
}
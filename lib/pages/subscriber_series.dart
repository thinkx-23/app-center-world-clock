import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class SubscriberSeries {
  String year;
  int subscribers;
  charts.Color barColor;

  SubscriberSeries({
    @required this.year,
    @required this.subscribers,
    @required this.barColor
  });
}
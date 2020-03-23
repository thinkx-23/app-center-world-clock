import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String loading;

  void setTime() async {
    WorldTime instace = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/London');
    await instace.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instace.location,
      'flag': instace.flag,
      'time': instace.time,
      'isDayTime' : instace.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}

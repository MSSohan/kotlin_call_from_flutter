import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EventChannel _kotlinEventChannel = EventChannel('kotlin_event_channel');
  List<dynamic> kotlinData = [];

  @override
  void initState() {
    super.initState();
    _kotlinEventChannel.receiveBroadcastStream().listen((data) {
      setState(() {
        kotlinData.add(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter-Kotlin Example (Event Channel)'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Data from Kotlin:'),
              for (var data in kotlinData)
                Text(data.toString()),
            ],
          ),
        ),
      ),
    );
  }
}

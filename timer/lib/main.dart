import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _mydatetime = new DateTime.now();
  var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm:ss');
  String _time = '';
  String _settime = '';

  void _onTimer(Timer timer) {
    var now = DateTime.now();
    var formattedNow = formatter.format(now);
    setState(() => _time = formattedNow);
    if (now.isAfter(_mydatetime)){
      _settime = 'おきてー';
    } else {
      _settime = '';
    }
  }

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'あなたが選択した日時は以下です:',
            ),
            Text(
              formatter.format(_mydatetime),
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              _time,
              style: TextStyle(fontSize: 30.0,fontFamily: 'IBMPlexMono',)
            ),
            Text(
              _settime,
              style: TextStyle(fontSize: 30.0,fontFamily: 'IBMPlexMono',)
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          DatePicker.showDateTimePicker(
            context,
            showTitleActions: true,
            onChanged: (date) {
            },
            onConfirm: (date) {
              setState(() {
                _mydatetime = date;
              });
            },
            currentTime: DateTime.now(),
          );
          Timer.periodic(Duration(seconds: 1),_onTimer,
         );

        },
        tooltip: 'Datetime',
        child: Icon(Icons.access_time),
      ),
    );
  }
}
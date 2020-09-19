import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Audio Recorder'),
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
  Timer timer;
  int Tstart = 60;

  void startTimer () {
    //https://stackoverflow.com/questions/54610121/flutter-countdown-timer
    //Used to simulate the duration of the recording
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (Tstart < 1) {
            timer.cancel();
          } else {
            Tstart = Tstart - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    //super.dispose();
  }

  void Record() {
    setState(() {
      startTimer();
    });
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
              'Currently Playing:'
            ),
            Text(
              'LastRecording.mp3'
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    onPressed: () {},
                  child: Text('Previous'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Stop'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Play'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Next'),
                ),
              ],
            ),
            Text(
              'Press Record to start Recording',
            ),
            Slider(
              min: 0,
              max: 100,
              value: 1,
              onChanged: (value) {
                setState(() {
                  value = value;
                });
              },
            ),
            Text(
              'Duration:'
            ),
            Text(
              '$Tstart',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Record,
        tooltip: 'Record',
        child: Icon(Icons.fiber_manual_record),
        backgroundColor: Colors.red,
      ),
    );
  }
}

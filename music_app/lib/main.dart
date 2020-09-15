import 'package:flutter/material.dart';
//import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_sound/flutter_sound.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Music App'),
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
  int _counter = 0;

  void Record() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }


  @override
  Widget build(BuildContext context) {

    bool gCheck = false;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                child: TextField(keyboardType: TextInputType.text)
            ),
            Container(
              //  https://www.woolha.com/tutorials/flutter-using-checkboxlisttile-widget-examples
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: CheckboxListTile(
                title: const Text('Placeholder'),
                //add a few more and replace text
                value: gCheck,
                onChanged: (bool value) {
                  setState(() {
                    gCheck = value;
                  });
                },
              ),
            ),
            Container(
                //https://flutter.dev/docs/cookbook/images/fading-in-images
              child:Image.network(
              //FadeInImage.assetNetwork(placeholder: 'assets/loading.gif',
                  'https://picsum.photos/250?image=9'),
              //replace url with clickable song pic from database url
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Record,
        tooltip: 'Increment',
        child: Icon(Icons.fiber_manual_record),
        backgroundColor: Colors.red,
      ),
    );
  }
}

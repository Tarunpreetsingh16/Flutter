// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';
import './appBar.dart';
import './title.dart' as title;
import './button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _text = "Hello Max";
  void changeText() {
    setState(() {
      _text = "I'm Tarun";
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: ApplicationBar(),
        body: Column(
          children: <Widget>[
            title.Title(_text), //namespacing
            AppButton(changeText),
          ],
        ),
      ),
    );
  }
}

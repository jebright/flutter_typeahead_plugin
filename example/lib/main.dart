import 'package:flutter/material.dart';

import 'package:flutter_typeahead_plugin/type_ahead.dart';
import 'sample_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //String _platformVersion = 'Unknown';
  SampleApi api;

  _MyAppState() {
    api = new SampleApi<String>();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Flutter Typeahead Demo'),
        ),
        body: new Column(
        children: <Widget>[
          new TypeAhead(api),
        ],
      ),
      ),
     theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}

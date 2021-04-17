import 'package:flutter/material.dart';
import 'package:flutter_element/widgets/el-button.dart';

import 'example/el-button-example.dart';
import 'example/el-radio-example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Element',
      theme: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              InkResponse(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contex) => ElButtonExample()));
                  },
                  child: ElButton(
                    text: "element Ui Button 实现",
                  )),
              InkResponse(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contex) => ElRadioExample()));
                },
                child: ElButton(
                  text: "element Ui Radio 单选按钮实现",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

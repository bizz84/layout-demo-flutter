import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';


class StackPage extends StatefulWidget {
  StackPage({Key key}) : super(key: key);

  @override
  _StackPageState createState() => new _StackPageState();
}

class _StackPageState extends State<StackPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(layoutName(LayoutType.stack)),
          elevation: 1.0,
      ),
      //drawer: Drawer(child: LayoutSelectionPage(onSelected: onLayoutSelected)),
      body: Container(
          color: Colors.yellow,
      ),
    );
  }
}
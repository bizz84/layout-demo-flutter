import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';

class ExpandedPage extends StatefulWidget {
  ExpandedPage({Key key}) : super(key: key);

  @override
  _ExpandedPageState createState() => new _ExpandedPageState();
}

class _ExpandedPageState extends State<ExpandedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(layoutName(LayoutType.expanded)),
        elevation: 1.0,
      ),
      //drawer: Drawer(child: LayoutSelectionPage(onSelected: onLayoutSelected)),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}

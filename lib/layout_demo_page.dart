import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_selection.dart';
import 'package:layout_demo_flutter/row_column_page.dart';


class LayoutDemoPage extends StatefulWidget {
  LayoutDemoPage({Key key}) : super(key: key);

  @override
  _LayoutDemoPageState createState() => new _LayoutDemoPageState();
}

class _LayoutDemoPageState extends State<LayoutDemoPage> {

  LayoutSelection layoutSelection = LayoutSelection.rowColumn;

  void onLayoutSelected(LayoutSelection selection) {
    setState(() {
      layoutSelection = selection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RowColumnPage();
  }
}


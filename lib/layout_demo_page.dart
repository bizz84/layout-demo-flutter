import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_attributes.dart';
import 'package:layout_demo_flutter/layout_selection.dart';


class LayoutDemoPage extends StatefulWidget {
  LayoutDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LayoutDemoPageState createState() => new _LayoutDemoPageState();
}

class _LayoutDemoPageState extends State<LayoutDemoPage> {

  bool isRow = true;
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
  MainAxisSize mainAxisSize = MainAxisSize.min;


  void updateLayout(int index) {
    isRow = index == 0;
    setState(() {});
  }
  void updateMainAxisAlignment(int index) {
    switch (index) {
      case 0:
        mainAxisAlignment = MainAxisAlignment.start;
        break;
      case 1:
        mainAxisAlignment = MainAxisAlignment.end;
        break;
      case 2:
        mainAxisAlignment = MainAxisAlignment.center;
        break;
      case 3:
        mainAxisAlignment = MainAxisAlignment.spaceBetween;
        break;
      case 4:
        mainAxisAlignment = MainAxisAlignment.spaceAround;
        break;
      case 5:
        mainAxisAlignment = MainAxisAlignment.spaceEvenly;
        break;
    }
    setState(() {});
  }
  void updateCrossAxisAlignment(int index) {
    switch (index) {
      case 0:
        crossAxisAlignment = CrossAxisAlignment.start;
        break;
      case 1:
        crossAxisAlignment = CrossAxisAlignment.end;
        break;
      case 2:
        crossAxisAlignment = CrossAxisAlignment.center;
        break;
      case 3:
        crossAxisAlignment = CrossAxisAlignment.stretch;
        break;
      case 4:
        crossAxisAlignment = CrossAxisAlignment.baseline;
        break;
    }
    setState(() {});
  }
  void updateMainAxisSize(int index) {
    mainAxisSize = index == 0 ? MainAxisSize.min : MainAxisSize.max;
    setState(() {});
  }

  Widget buildContent() {
    if (isRow) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: [
          Icon(Icons.stars, size: 50.0),
          Icon(Icons.stars, size: 100.0),
          Icon(Icons.stars, size: 50.0),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: [
          Icon(Icons.stars, size: 50.0),
          Icon(Icons.stars, size: 100.0),
          Icon(Icons.stars, size: 50.0),
        ],
      );
    }
  }

  void onLayoutSelected(LayoutSelection selection) {
    print('$selection');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 1.0,
        bottom: PreferredSize(
          preferredSize: Size(375.0, 150.0),
          child: buildOptionsPage(),
        )
      ),
      drawer: Drawer(child: LayoutSelectionPage(onSelected: onLayoutSelected)),
      body: Container(
        color: Colors.yellow,
        child: buildContent()
      ),

    );
  }

  Widget buildOptionsPage() {
    return LayoutAttributes(
      onUpdateLayout: updateLayout,
      onUpdateMainAxisAlignment: updateMainAxisAlignment,
      onUpdateCrossAxisAlignment: updateCrossAxisAlignment,
      onUpdateMainAxisSize: updateMainAxisSize,
    );
  }
}


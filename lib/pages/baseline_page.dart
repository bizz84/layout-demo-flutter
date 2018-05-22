import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';

class BaselinePage extends StatelessWidget {
  BaselinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(layoutName(LayoutType.baseline)),
        elevation: 1.0,
      ),
      //drawer: Drawer(child: LayoutSelectionPage(onSelected: onLayoutSelected)),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Flutter',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            SizedBox(width: 5.0),
            Text(
              'Layout',
              style: TextStyle(fontSize: 32.0, color: Colors.red),
            ),
            SizedBox(width: 5.0),
            Text(
              'Is',
              style: TextStyle(fontSize: 18.0, color: Colors.indigo),
            ),
            SizedBox(width: 5.0),
            Text(
              'Great',
              style: TextStyle(fontSize: 26.0, color: Colors.green),
            ),
          ],
        ),
        SizedBox(height: 30.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'abcdefg',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            SizedBox(width: 5.0),
            Text(
              'hijklmn',
              style: TextStyle(fontSize: 21.0, color: Colors.red),
            ),
            SizedBox(width: 5.0),
            Text(
              'opqrst',
              style: TextStyle(fontSize: 18.0, color: Colors.indigo),
            ),
            SizedBox(width: 5.0),
            Text(
              'uvwxyz',
              style: TextStyle(fontSize: 15.0, color: Colors.green),
            ),
          ],
        ),
      ],
    );
  }
}

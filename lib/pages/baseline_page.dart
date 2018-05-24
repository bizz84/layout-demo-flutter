import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';
import 'package:layout_demo_flutter/pages/appbar_builder.dart';
import 'package:layout_demo_flutter/pages/baseline_layout_attributes.dart';

class BaselinePage extends StatefulWidget {
  BaselinePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BaselinePageState();
}
class BaselinePageState extends State<BaselinePage> {

  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.baseline;

  CrossAxisAlignment _crossAxisAlignmentFromIndex(int index) {
    switch (index) {
      case 0:
        return CrossAxisAlignment.baseline;
      case 1:
        return CrossAxisAlignment.start;
      case 2:
        return CrossAxisAlignment.end;
      case 3:
        return CrossAxisAlignment.center;
      case 4:
        return CrossAxisAlignment.stretch;
    }
    return CrossAxisAlignment.start;
  }

  void _updateCrossAxisAlignment(int index) {
    setState(() {
      _crossAxisAlignment = _crossAxisAlignmentFromIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder.build(
        layoutType: LayoutType.baseline,
        bottom: PreferredSize(
          preferredSize: Size(0.0, 80.0),
          child: _buildLayoutAttributesPage(),
        ),
      ),
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
          crossAxisAlignment: _crossAxisAlignment,
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

  Widget _buildLayoutAttributesPage() {
    return BaselineLayoutAttributes(
      onUpdateCrossAxisAlignment: _updateCrossAxisAlignment,
    );
  }

}

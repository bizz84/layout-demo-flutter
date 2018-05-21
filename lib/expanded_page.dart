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
        child: _buildContent(),
      ),
    );
  }

  Widget _buildBox(
      {int points, Color color, Color textColor = Colors.white}) {
    return Expanded(
      flex: points,
      child: Container(
        constraints: BoxConstraints.expand(),
        color: color,
        child: Center(
          child: Text(
            '$points',
            style: TextStyle(fontSize: 32.0, color: textColor),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildBox(points: 8, color: Colors.red),
        Expanded(
          flex: 5,
          child: Row(
            children: [
              _buildBox(points: 5, color: Colors.indigo),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                _buildBox(points: 1, color: Colors.green),
                                _buildBox(points: 1, color: Colors.blue),
                              ],
                            ),
                          ),
                          _buildBox(points: 2, color: Colors.brown),
                        ],
                      ),
                    ),
                    _buildBox(points: 3, color: Colors.purple),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

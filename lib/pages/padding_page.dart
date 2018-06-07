import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:layout_demo_flutter/layout_type.dart';
import 'package:layout_demo_flutter/pages/main_app_bar.dart';

class PaddingPage extends StatelessWidget implements HasLayoutGroup {
  PaddingPage({Key key, this.layoutGroup, this.onLayoutToggle})
      : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  Widget _buildText(
      {String text, Color color, Color textColor = Colors.white}) {
    return Container(
      alignment: AlignmentDirectional.center,
      color: color,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 32.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: layoutGroup,
        layoutType: LayoutType.padding,
        onLayoutToggle: onLayoutToggle,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VerticalPadding(
            color: Colors.green[100],
            child: _buildText(text: 'First', color: Colors.green),
          ),
          VerticalPadding(
            color: Colors.red[100],
            child: _buildText(text: 'Second', color: Colors.red),
          ),
          SizedBox(
            height: 50.0,
            child: _buildText(
                text: '50 pt', color: Colors.white, textColor: Colors.black),
          ),
          VerticalPadding(
            color: Colors.blue[100],
            child: _buildText(text: 'Third', color: Colors.blue),
          ),
          Expanded(
            flex: 1,
            child: _buildText(
                text: 'flex: 1', color: Colors.white, textColor: Colors.black),
          ),
          VerticalPadding(
            color: Colors.purple[100],
            child: _buildText(text: 'Fourth', color: Colors.purple),
          ),
          Expanded(
            flex: 2,
            child: _buildText(
                text: 'flex: 2', color: Colors.white, textColor: Colors.black),
          ),
          VerticalPadding(
            color: Colors.brown[100],
            child: _buildText(text: 'Fifth', color: Colors.brown),
          ),
        ],
      ),
    );
  }
}

class VerticalPadding extends StatelessWidget {
  VerticalPadding({
    @required this.child,
    this.padding = 16.0,
    this.color = Colors.white,
  });

  final double padding;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.symmetric(vertical: padding),
      child: child,
    );
  }
}

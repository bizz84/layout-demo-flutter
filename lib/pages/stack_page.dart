import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';
import 'package:layout_demo_flutter/pages/main_app_bar.dart';
import 'package:layout_demo_flutter/pages/stack_layout_attributes.dart';

class StackPage extends StatefulWidget implements HasLayoutGroup {
  StackPage({Key key, this.layoutGroup, this.onLayoutToggle}) : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  _StackPageState createState() => new _StackPageState();
}

class _StackPageState extends State<StackPage> {

  bool _useAlignment = true;
  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.topStart;

  AlignmentDirectional alignmentFromIndex(int index) {
    switch (index) {
      case 0:
        return AlignmentDirectional.topStart;
      case 1:
        return AlignmentDirectional.topCenter;
      case 2:
        return AlignmentDirectional.topEnd;
      case 3:
        return AlignmentDirectional.centerStart;
      case 4:
        return AlignmentDirectional.center;
      case 5:
        return AlignmentDirectional.centerEnd;
      case 6:
        return AlignmentDirectional.bottomStart;
      case 7:
        return AlignmentDirectional.bottomCenter;
      case 8:
        return AlignmentDirectional.bottomEnd;
    }
    return AlignmentDirectional.center;
  }

  void updateAlignment(int index) {
    setState(() {
      _alignmentDirectional = alignmentFromIndex(index);
    });
  }

  void updateType(int index) {
    setState(() {
      _useAlignment = index == 0;
    });
  }

  Widget _buildStack() {
    if (_useAlignment) {
      return Stack(
        alignment: _alignmentDirectional,
        children: <Widget>[
          SizedBox(
            width: 300.0,
            height: 300.0,
            child: Container(
              color: Colors.green,
            ),
          ),
          SizedBox(
            width: 200.0,
            height: 200.0,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      );
    } else {
      return Stack(
        alignment: _alignmentDirectional,
        children: <Widget>[
          SizedBox(
            width: 300.0,
            height: 300.0,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Positioned(
            left: 20.0,
            top: 20.0,
            width: 100.0,
            height: 100.0,
            child: Container(
              color: Colors.indigo,
            ),
          ),
          Positioned(
            right: 40.0,
            top: 40.0,
            width: 100.0,
            height: 100.0,
            child: Container(
              color: Colors.red,
            ),
          ),
          Positioned(
            left: 40.0,
            bottom: 40.0,
            width: 100.0,
            height: 100.0,
            child: Container(
              color: Colors.green,
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            width: 100.0,
            height: 100.0,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: widget.layoutGroup,
        layoutType: LayoutType.stack,
        bottom: PreferredSize(
          preferredSize: Size(0.0, 80.0),
          child: _buildLayoutAttributesPage(),
        ),
        onLayoutToggle: widget.onLayoutToggle,
      ),
      body: Center(
        child: _buildStack(),
      ),
    );
  }

  Widget _buildLayoutAttributesPage() {
    return StackLayoutAttributes(
      onUpdateType: updateType,
      onUpdateAlignment: updateAlignment,
    );
  }
}

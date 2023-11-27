// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:layout_demo_flutter/layout_type.dart';
import 'package:layout_demo_flutter/pages/main_app_bar.dart';
import 'package:layout_demo_flutter/pages/stack_layout_attributes.dart';

class StackPage extends StatefulWidget implements HasLayoutGroup {
  const StackPage({
    super.key,
    required this.layoutGroup,
    required this.onLayoutToggle,
  });

  @override
  final LayoutGroup layoutGroup;
  @override
  final VoidCallback onLayoutToggle;

  @override
  State<StackPage> createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  bool _useAlignment = true;
  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.topStart;

  AlignmentDirectional _alignmentFromIndex(int index) => switch (index) {
        0 => AlignmentDirectional.topStart,
        1 => AlignmentDirectional.topCenter,
        2 => AlignmentDirectional.topEnd,
        3 => AlignmentDirectional.centerStart,
        4 => AlignmentDirectional.center,
        5 => AlignmentDirectional.centerEnd,
        6 => AlignmentDirectional.bottomStart,
        7 => AlignmentDirectional.bottomCenter,
        8 => AlignmentDirectional.bottomEnd,
        _ => AlignmentDirectional.center,
      };

  void _updateAlignment(int index) {
    setState(() {
      _alignmentDirectional = _alignmentFromIndex(index);
    });
  }

  void _updateType(int index) {
    setState(() {
      _useAlignment = index == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: widget.layoutGroup,
        layoutType: LayoutType.stack,
        bottom: PreferredSize(
          preferredSize: const Size(0.0, 80.0),
          child: StackLayoutAttributes(
            onUpdateType: _updateType,
            onUpdateAlignment: _updateAlignment,
          ),
        ),
        onLayoutToggle: widget.onLayoutToggle,
      ),
      body: Center(
        child: StackContent(
          useAlignment: _useAlignment,
          alignment: _alignmentDirectional,
        ),
      ),
    );
  }
}

class StackContent extends StatelessWidget {
  const StackContent({
    super.key,
    required this.useAlignment,
    required this.alignment,
  });
  final bool useAlignment;
  final AlignmentDirectional alignment;

  @override
  Widget build(BuildContext context) {
    if (useAlignment) {
      return Stack(
        alignment: alignment,
        children: const <Widget>[
          SizedBox(
            width: 300.0,
            height: 300.0,
            child: ColoredBox(
              color: Colors.green,
            ),
          ),
          SizedBox(
            width: 200.0,
            height: 200.0,
            child: ColoredBox(
              color: Colors.yellow,
            ),
          ),
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: ColoredBox(
              color: Colors.red,
            ),
          ),
        ],
      );
    } else {
      return Stack(
        alignment: alignment,
        children: const <Widget>[
          SizedBox(
            width: 300.0,
            height: 300.0,
            child: ColoredBox(
              color: Colors.yellow,
            ),
          ),
          Positioned(
            left: 20.0,
            top: 20.0,
            width: 100.0,
            height: 100.0,
            child: ColoredBox(
              color: Colors.indigo,
            ),
          ),
          Positioned(
            right: 40.0,
            top: 40.0,
            width: 100.0,
            height: 100.0,
            child: ColoredBox(
              color: Colors.red,
            ),
          ),
          Positioned(
            left: 40.0,
            bottom: 40.0,
            width: 100.0,
            height: 100.0,
            child: ColoredBox(
              color: Colors.green,
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            width: 100.0,
            height: 100.0,
            child: ColoredBox(
              color: Colors.blue,
            ),
          ),
        ],
      );
    }
  }
}

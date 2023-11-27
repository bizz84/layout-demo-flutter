import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';
import 'package:layout_demo_flutter/pages/main_app_bar.dart';
import 'package:layout_demo_flutter/pages/row_column_layout_attributes.dart';

class RowColumnPage extends StatefulWidget implements HasLayoutGroup {
  const RowColumnPage({
    super.key,
    required this.layoutGroup,
    required this.onLayoutToggle,
  });

  @override
  final LayoutGroup layoutGroup;
  @override
  final VoidCallback onLayoutToggle;

  @override
  State<RowColumnPage> createState() => _RowColumnPageState();
}

class _RowColumnPageState extends State<RowColumnPage> {
  var _isRow = true;
  var _mainAxisAlignment = MainAxisAlignment.start;
  var _crossAxisAlignment = CrossAxisAlignment.start;
  var _mainAxisSize = MainAxisSize.min;

  MainAxisAlignment _mainAxisAlignmentFromIndex(int index) => switch (index) {
        0 => MainAxisAlignment.start,
        1 => MainAxisAlignment.end,
        2 => MainAxisAlignment.center,
        3 => MainAxisAlignment.spaceBetween,
        4 => MainAxisAlignment.spaceAround,
        5 => MainAxisAlignment.spaceEvenly,
        _ => MainAxisAlignment.start,
      };

  CrossAxisAlignment _crossAxisAlignmentFromIndex(int index) => switch (index) {
        0 => CrossAxisAlignment.baseline,
        1 => CrossAxisAlignment.start,
        2 => CrossAxisAlignment.end,
        3 => CrossAxisAlignment.center,
        4 => CrossAxisAlignment.stretch,
        _ => CrossAxisAlignment.start,
      };

  void _updateLayout(int index) {
    setState(() {
      _isRow = index == 0;
    });
  }

  void _updateMainAxisAlignment(int index) {
    setState(() {
      _mainAxisAlignment = _mainAxisAlignmentFromIndex(index);
    });
  }

  void _updateCrossAxisAlignment(int index) {
    setState(() {
      _crossAxisAlignment = _crossAxisAlignmentFromIndex(index);
    });
  }

  void _updateMainAxisSize(int index) {
    setState(() {
      _mainAxisSize = index == 0 ? MainAxisSize.min : MainAxisSize.max;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: widget.layoutGroup,
        layoutType: LayoutType.rowColumn,
        bottom: PreferredSize(
          preferredSize: const Size(0.0, 160.0),
          child: RowColumnLayoutAttributes(
            onUpdateLayout: _updateLayout,
            onUpdateMainAxisAlignment: _updateMainAxisAlignment,
            onUpdateCrossAxisAlignment: _updateCrossAxisAlignment,
            onUpdateMainAxisSize: _updateMainAxisSize,
          ),
        ),
        onLayoutToggle: widget.onLayoutToggle,
      ),
      body: ColoredBox(
        color: Colors.yellow,
        child: _isRow
            ? Row(
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                mainAxisSize: _mainAxisSize,
                children: const [
                  Icon(Icons.stars, size: 50.0),
                  Icon(Icons.stars, size: 100.0),
                  Icon(Icons.stars, size: 50.0),
                ],
              )
            : Column(
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                mainAxisSize: _mainAxisSize,
                children: const [
                  Icon(Icons.stars, size: 50.0),
                  Icon(Icons.stars, size: 100.0),
                  Icon(Icons.stars, size: 50.0),
                ],
              ),
      ),
    );
  }
}

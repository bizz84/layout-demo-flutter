import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';
import 'package:layout_demo_flutter/pages/main_app_bar.dart';
import 'package:layout_demo_flutter/pages/row_column_layout_attributes.dart';

class RowColumnPage extends StatefulWidget implements HasLayoutGroup {
  RowColumnPage({Key key, this.layoutGroup, this.onLayoutToggle}) : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  _RowColumnPageState createState() => new _RowColumnPageState();
}

class _RowColumnPageState extends State<RowColumnPage> {
  bool _isRow = true;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;
  MainAxisSize _mainAxisSize = MainAxisSize.min;

  void _updateLayout(int index) {
    setState(() {
      _isRow = index == 0;
    });
  }

  MainAxisAlignment _mainAxisAlignmentFromIndex(int index) {
    switch (index) {
      case 0:
        return MainAxisAlignment.start;
      case 1:
        return MainAxisAlignment.end;
      case 2:
        return MainAxisAlignment.center;
      case 3:
        return MainAxisAlignment.spaceBetween;
      case 4:
        return MainAxisAlignment.spaceAround;
      case 5:
        return MainAxisAlignment.spaceEvenly;
    }
    return MainAxisAlignment.start;
  }

  void _updateMainAxisAlignment(int index) {
    setState(() {
      _mainAxisAlignment = _mainAxisAlignmentFromIndex(index);
    });
  }

  CrossAxisAlignment _crossAxisAlignmentFromIndex(int index) {
    switch (index) {
      case 0:
        return CrossAxisAlignment.start;
      case 1:
        return CrossAxisAlignment.end;
      case 2:
        return CrossAxisAlignment.center;
      case 3:
        return CrossAxisAlignment.stretch;
      case 4:
        return CrossAxisAlignment.baseline;
    }
    return CrossAxisAlignment.start;
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

  Widget buildContent() {
    if (_isRow) {
      return Row(
        mainAxisAlignment: _mainAxisAlignment,
        crossAxisAlignment: _crossAxisAlignment,
        mainAxisSize: _mainAxisSize,
        children: [
          Icon(Icons.stars, size: 50.0),
          Icon(Icons.stars, size: 100.0),
          Icon(Icons.stars, size: 50.0),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: _mainAxisAlignment,
        crossAxisAlignment: _crossAxisAlignment,
        mainAxisSize: _mainAxisSize,
        children: [
          Icon(Icons.stars, size: 50.0),
          Icon(Icons.stars, size: 100.0),
          Icon(Icons.stars, size: 50.0),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: widget.layoutGroup,
        layoutType: LayoutType.rowColumn,
        bottom: PreferredSize(
          preferredSize: Size(0.0, 160.0),
          child: _buildLayoutAttributesPage(),
        ),
        onLayoutToggle: widget.onLayoutToggle,
      ),
      body: Container(color: Colors.yellow, child: buildContent()),
    );
  }

  Widget _buildLayoutAttributesPage() {
    return RowColumnLayoutAttributes(
      onUpdateLayout: _updateLayout,
      onUpdateMainAxisAlignment: _updateMainAxisAlignment,
      onUpdateCrossAxisAlignment: _updateCrossAxisAlignment,
      onUpdateMainAxisSize: _updateMainAxisSize,
    );
  }
}

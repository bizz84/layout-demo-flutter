import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/pages/expanded_page.dart';
import 'package:layout_demo_flutter/layout_type.dart';
import 'package:layout_demo_flutter/pages/padding_page.dart';
import 'package:layout_demo_flutter/pages/row_column_page.dart';
import 'package:layout_demo_flutter/pages/stack_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LayoutType _layoutSelection = LayoutType.rowColumn;

  void _onLayoutSelected(LayoutType selection) {
    setState(() {
      _layoutSelection = selection;
    });
  }

  void _onSelectTab(int index) {
    switch (index) {
      case 0:
        _onLayoutSelected(LayoutType.rowColumn);
        break;
      case 1:
        _onLayoutSelected(LayoutType.stack);
        break;
      case 2:
        _onLayoutSelected(LayoutType.expanded);
        break;
      case 3:
        _onLayoutSelected(LayoutType.padding);
        break;
    }
  }

  Color _colorTabMatching({LayoutType layoutSelection}) {
    return _layoutSelection == layoutSelection ? Colors.orange : Colors.grey;
  }

  BottomNavigationBarItem _buildItem(
      {IconData icon, LayoutType layoutSelection}) {
    String text = layoutName(layoutSelection);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(layoutSelection: layoutSelection),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(layoutSelection: layoutSelection),
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_layoutSelection) {
      case LayoutType.rowColumn:
        return RowColumnPage();
      case LayoutType.stack:
        return StackPage();
      case LayoutType.expanded:
        return ExpandedPage();
      case LayoutType.padding:
        return PaddingPage();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(icon: Icons.dehaze, layoutSelection: LayoutType.rowColumn),
          _buildItem(icon: Icons.layers, layoutSelection: LayoutType.stack),
          _buildItem(
              icon: Icons.line_weight, layoutSelection: LayoutType.expanded),
          _buildItem(
              icon: Icons.format_line_spacing, layoutSelection: LayoutType.padding),
        ],
        onTap: _onSelectTab,
      ),
    );
  }
}

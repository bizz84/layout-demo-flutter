import 'package:flutter/material.dart';


enum LayoutSelection {
  rowColumn,
  stack,
  expanded
}

String layoutName(LayoutSelection layoutSelection) {
  switch (layoutSelection) {
    case LayoutSelection.rowColumn: return 'Row / Column';
    case LayoutSelection.stack: return 'Stack';
    case LayoutSelection.expanded: return 'Expanded';
    default: return '';
  }
}

class LayoutSelectionPage extends StatelessWidget {
  LayoutSelectionPage({this.onSelected});
  final ValueChanged<LayoutSelection> onSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Layout Selection'),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            ListTile(
              title: Text('Row/Column'),
              onTap: () => onSelected(LayoutSelection.rowColumn),
            ),
            ListTile(
              title: Text('Stack'),
              onTap: () => onSelected(LayoutSelection.stack),
            ),
            ListTile(
              title: Text('Expanded'),
              onTap: () => onSelected(LayoutSelection.expanded),
            ),
          ],
        ));
  }
}


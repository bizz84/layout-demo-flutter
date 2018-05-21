
enum LayoutType {
  rowColumn,
  stack,
  expanded
}

String layoutName(LayoutType layoutType) {
  switch (layoutType) {
    case LayoutType.rowColumn: return 'Row / Column';
    case LayoutType.stack: return 'Stack';
    case LayoutType.expanded: return 'Expanded';
    default: return '';
  }
}

//class LayoutSelectionPage extends StatelessWidget {
//  LayoutSelectionPage({this.onSelected});
//  final ValueChanged<LayoutType> onSelected;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: ListView(
//        padding: EdgeInsets.zero,
//        children: [
//          DrawerHeader(
//            child: Text('Layout Selection'),
//            decoration: BoxDecoration(
//              color: Colors.orange,
//            ),
//          ),
//          ListTile(
//            title: Text('Row/Column'),
//            onTap: () => onSelected(LayoutType.rowColumn),
//          ),
//          ListTile(
//            title: Text('Stack'),
//            onTap: () => onSelected(LayoutType.stack),
//          ),
//          ListTile(
//            title: Text('Expanded'),
//            onTap: () => onSelected(LayoutType.expanded),
//          ),
//        ],
//      ));
//  }
//}
//

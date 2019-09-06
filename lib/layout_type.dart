import 'package:flutter/foundation.dart';

enum LayoutGroup {
  nonScrollable,
  scrollable,
}

abstract class HasLayoutGroup {
  LayoutGroup get layoutGroup;
  VoidCallback get onLayoutToggle;
}

enum LayoutType {
  rowColumn,
  baseline,
  stack,
  expanded,
  padding,
  pageView,
  list,
  slivers,
  hero,
  nested,
}

Map<LayoutType, String> layoutNames = {
  LayoutType.rowColumn: 'Row / Col',
  LayoutType.baseline: 'Baseline',
  LayoutType.stack: 'Stack',
  LayoutType.expanded: 'Expanded',
  LayoutType.padding: 'Padding',
  LayoutType.pageView: 'Page View',
  LayoutType.list: 'List',
  LayoutType.slivers: 'Slivers',
  LayoutType.hero: 'Hero',
  LayoutType.nested: 'Nested',
};

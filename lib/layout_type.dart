
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

String layoutName(LayoutType layoutType) {
  switch (layoutType) {
    case LayoutType.rowColumn:
      return 'Row / Col';
    case LayoutType.baseline:
      return 'Baseline';
    case LayoutType.stack:
      return 'Stack';
    case LayoutType.expanded:
      return 'Expanded';
    case LayoutType.padding:
      return 'Padding';
    case LayoutType.pageView:
      return 'Page View';
    case LayoutType.list:
      return 'List';
    case LayoutType.slivers:
      return 'Slivers';
    case LayoutType.hero:
      return 'Hero';
    case LayoutType.nested:
      return 'Nested';
    default:
      return '';
  }
}

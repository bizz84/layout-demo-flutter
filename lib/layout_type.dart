
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
  grid,
  custom,
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
    case LayoutType.grid:
      return 'Grid';
    case LayoutType.custom:
      return 'Custom';
    default:
      return '';
  }
}

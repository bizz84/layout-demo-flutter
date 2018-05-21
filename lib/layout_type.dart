enum LayoutType {
  rowColumn,
  stack,
  expanded,
  padding,
}

String layoutName(LayoutType layoutType) {
  switch (layoutType) {
    case LayoutType.rowColumn:
      return 'Row / Col';
    case LayoutType.stack:
      return 'Stack';
    case LayoutType.expanded:
      return 'Expanded';
    case LayoutType.padding:
      return 'Padding';
    default:
      return '';
  }
}

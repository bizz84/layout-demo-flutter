import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';

class AppBarBuilder {

  static AppBar build({LayoutType layoutType, PreferredSize bottom}) {
    return AppBar(
      title: Text(layoutName(layoutType)),
      elevation: 1.0,
      bottom: bottom,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';

class MainAppBar extends AppBar {
  MainAppBar({
    LayoutGroup layoutGroup,
    LayoutType layoutType,
    PreferredSize bottom,
    VoidCallback onLayoutToggle,
  }) : super(
          leading: IconButton(
            icon: Icon(layoutGroup == LayoutGroup.nonScrollable
                ? Icons.filter_1
                : Icons.filter_2),
            onPressed: onLayoutToggle,
          ),
          title: Text(layoutNames[layoutType]),
          elevation: 1.0,
          bottom: bottom,
        );
}

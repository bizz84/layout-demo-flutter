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
            icon: Icon(layoutGroup == LayoutGroup.nonScrollable ? Icons.grid_on : Icons.home),
            onPressed: onLayoutToggle,
          ),
          title: Text(layoutName(layoutType)),
          elevation: 1.0,
          bottom: bottom,
        );
}

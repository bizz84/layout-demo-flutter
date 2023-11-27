import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';
import 'package:layout_demo_flutter/pages/main_app_bar.dart';

class ExpandedPage extends StatelessWidget implements HasLayoutGroup {
  const ExpandedPage({
    super.key,
    required this.layoutGroup,
    required this.onLayoutToggle,
  });

  @override
  final LayoutGroup layoutGroup;
  @override
  final VoidCallback onLayoutToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: layoutGroup,
        layoutType: LayoutType.expanded,
        onLayoutToggle: onLayoutToggle,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildBox({
    required int points,
    required Color color,
    Color textColor = Colors.white,
  }) {
    return Expanded(
      flex: points,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: ColoredBox(
          color: color,
          child: Center(
            child: Text(
              '$points',
              style: TextStyle(fontSize: 32.0, color: textColor),
            ),
          ),
        ),
      ),
    );
  }

  Size _goldenRatio(BoxConstraints constraints) {
    double ratio = 13.0 / 8.0;
    if (constraints.maxHeight / constraints.maxWidth > ratio) {
      double height = constraints.maxWidth * ratio;
      return Size(constraints.maxWidth, height);
    } else {
      double width = constraints.maxHeight / ratio;
      return Size(width, constraints.maxHeight);
    }
  }

  Widget _centeredLayout({Widget? child}) {
    return LayoutBuilder(builder: (content, constraints) {
      Size size = _goldenRatio(constraints);
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: size.width,
            maxHeight: size.height,
          ),
          child: child,
        ),
      );
    });
  }

  Widget _buildContent() {
    return _centeredLayout(
      child: Column(
        children: [
          _buildBox(points: 8, color: Colors.red),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                _buildBox(points: 5, color: Colors.indigo),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  _buildBox(points: 1, color: Colors.green),
                                  _buildBox(points: 1, color: Colors.blue),
                                ],
                              ),
                            ),
                            _buildBox(points: 2, color: Colors.brown),
                          ],
                        ),
                      ),
                      _buildBox(points: 3, color: Colors.purple),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

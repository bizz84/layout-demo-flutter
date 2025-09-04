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
      body: const ExpandedContent(),
    );
  }
}

class ExpandedContent extends StatelessWidget {
  const ExpandedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const CenteredGoldenRatioLayout(
      child: Column(
        children: [
          ExpandedColoredBox(points: 8, color: Colors.red),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                ExpandedColoredBox(points: 5, color: Colors.indigo),
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
                                  ExpandedColoredBox(
                                    points: 1,
                                    color: Colors.green,
                                  ),
                                  ExpandedColoredBox(
                                    points: 1,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            ExpandedColoredBox(points: 2, color: Colors.brown),
                          ],
                        ),
                      ),
                      ExpandedColoredBox(points: 3, color: Colors.purple),
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

class CenteredGoldenRatioLayout extends StatelessWidget {
  const CenteredGoldenRatioLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (content, constraints) {
        final size = _goldenRatio(constraints);
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: size.width,
              maxHeight: size.height,
            ),
            child: child,
          ),
        );
      },
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
}

class ExpandedColoredBox extends StatelessWidget {
  const ExpandedColoredBox({
    super.key,
    required this.points,
    required this.color,
    this.textColor = Colors.white,
  });
  final int points;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
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
}

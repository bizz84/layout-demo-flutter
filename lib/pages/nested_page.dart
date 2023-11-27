import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';
import 'package:layout_demo_flutter/pages/main_app_bar.dart';

class NestedPage extends StatelessWidget implements HasLayoutGroup {
  const NestedPage({
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
        layoutType: LayoutType.nested,
        onLayoutToggle: onLayoutToggle,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return ListView.builder(
        itemCount: 16,
        itemBuilder: (BuildContext content, int index) {
          return _buildHorizontalList(parentIndex: index);
        });
  }

  Widget _buildHorizontalList({required int parentIndex}) {
    var colors = [
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.red,
      Colors.orange
    ];
    double height = 136.0;
    return SizedBox(
      height: height,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (BuildContext content, int index) {
            return _buildItem(
              index: index + 1,
              color: colors[(parentIndex + index) % colors.length],
              parentSize: height,
            );
          }),
    );
  }

  Widget _buildItem({
    required int index,
    required Color color,
    required double parentSize,
  }) {
    double edgeSize = 8.0;
    double itemSize = parentSize - edgeSize * 2.0;
    return Padding(
      padding: EdgeInsets.all(edgeSize),
      child: SizedBox(
        width: itemSize,
        height: itemSize,
        child: ColoredBox(
          color: color,
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              '$index',
              style: const TextStyle(fontSize: 72.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

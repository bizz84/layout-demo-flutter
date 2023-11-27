import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';

class SliversPage extends StatelessWidget implements HasLayoutGroup {
  const SliversPage({
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
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          pinned: true,
          title: const Text('Slivers'),
          leading: IconButton(
            icon: Icon(layoutGroup == LayoutGroup.nonScrollable
                ? Icons.filter_1
                : Icons.filter_2),
            onPressed: onLayoutToggle,
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ColoredBox(
                color: Colors.teal[index % 9 == 0 ? 50 : 100 * (index % 9)]!,
                child: Align(
                  alignment: Alignment.center,
                  child: Text('grid item $index'),
                ),
              );
            },
            childCount: 20,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ColoredBox(
                color:
                    Colors.lightBlue[index % 9 == 0 ? 50 : 100 * (index % 9)]!,
                child: Align(
                  alignment: Alignment.center,
                  child: Text('list item $index'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

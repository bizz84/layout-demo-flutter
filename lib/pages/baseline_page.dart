import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';
import 'package:layout_demo_flutter/pages/main_app_bar.dart';
import 'package:layout_demo_flutter/pages/baseline_layout_attributes.dart';

class BaselinePage extends StatefulWidget implements HasLayoutGroup {
  const BaselinePage({
    super.key,
    required this.layoutGroup,
    required this.onLayoutToggle,
  });

  @override
  final LayoutGroup layoutGroup;
  @override
  final VoidCallback onLayoutToggle;

  @override
  State<StatefulWidget> createState() => BaselinePageState();
}

class BaselinePageState extends State<BaselinePage> {
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.baseline;

  CrossAxisAlignment _crossAxisAlignmentFromIndex(int index) => switch (index) {
    0 => CrossAxisAlignment.baseline,
    1 => CrossAxisAlignment.start,
    2 => CrossAxisAlignment.end,
    3 => CrossAxisAlignment.center,
    4 => CrossAxisAlignment.stretch,
    _ => CrossAxisAlignment.start,
  };

  void _updateCrossAxisAlignment(int index) {
    setState(() {
      _crossAxisAlignment = _crossAxisAlignmentFromIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: widget.layoutGroup,
        layoutType: LayoutType.baseline,
        bottom: PreferredSize(
          preferredSize: const Size(0.0, 80.0),
          child: BaselineLayoutAttributes(
            onUpdateCrossAxisAlignment: _updateCrossAxisAlignment,
          ),
        ),
        onLayoutToggle: widget.onLayoutToggle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BaselineContent(crossAxisAlignment: _crossAxisAlignment),
      ),
    );
  }
}

class BaselineContent extends StatelessWidget {
  const BaselineContent({super.key, required this.crossAxisAlignment});
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredBox(
          color: Colors.yellow,
          child: Row(
            crossAxisAlignment: crossAxisAlignment,
            textBaseline: TextBaseline.alphabetic,
            children: const [
              Text(
                'Flutter',
                style: TextStyle(fontSize: 24.0, color: Colors.blue),
              ),
              SizedBox(width: 5.0),
              Text(
                'Layout',
                style: TextStyle(fontSize: 32.0, color: Colors.red),
              ),
              SizedBox(width: 5.0),
              Text(
                'Is',
                style: TextStyle(fontSize: 18.0, color: Colors.indigo),
              ),
              SizedBox(width: 5.0),
              Text(
                'Great',
                style: TextStyle(fontSize: 26.0, color: Colors.green),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30.0),
        ColoredBox(
          color: Colors.yellow,
          child: Row(
            crossAxisAlignment: crossAxisAlignment,
            textBaseline: TextBaseline.alphabetic,
            children: const [
              Text('Big', style: TextStyle(fontSize: 48.0, color: Colors.blue)),
              SizedBox(width: 5.0),
              Text(
                'Medium',
                style: TextStyle(fontSize: 32.0, color: Colors.red),
              ),
              SizedBox(width: 5.0),
              Text(
                'Small',
                style: TextStyle(fontSize: 16.0, color: Colors.indigo),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

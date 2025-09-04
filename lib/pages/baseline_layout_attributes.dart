import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_attribute_selector.dart';

class BaselineLayoutAttributes extends StatefulWidget {
  const BaselineLayoutAttributes({
    super.key,
    required this.onUpdateCrossAxisAlignment,
  });

  final ValueChanged<int> onUpdateCrossAxisAlignment;

  @override
  State<StatefulWidget> createState() => BaselineLayoutAttributesState();
}

class BaselineLayoutAttributesState extends State<BaselineLayoutAttributes> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: LayoutAttributeSelector(
            title: 'Cross Axis Alignment',
            values: const [
              'baseline',
              'start',
              'end',
              'center',
              //'stretch',
            ],
            onIndexChanged: widget.onUpdateCrossAxisAlignment,
          ),
        ),
      ],
    );
  }
}

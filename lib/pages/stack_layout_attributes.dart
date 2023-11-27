import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_attribute_selector.dart';

class StackLayoutAttributes extends StatefulWidget {
  const StackLayoutAttributes({
    super.key,
    required this.onUpdateType,
    required this.onUpdateAlignment,
  });

  final ValueChanged<int> onUpdateType;
  final ValueChanged<int> onUpdateAlignment;

  @override
  State<StatefulWidget> createState() => StackLayoutAttributesState();
}

class StackLayoutAttributesState extends State<StackLayoutAttributes> {
  bool _alignmentDisabled = false;

  void _updateType(int index) {
    widget.onUpdateType(index);
    setState(() {
      _alignmentDisabled = index == 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: LayoutAttributeSelector(
            title: 'Type',
            values: const [
              'align',
              'position',
            ],
            onIndexChanged: _updateType,
          ),
        ),
        Expanded(
          child: LayoutAttributeSelector(
            title: 'Alignment',
            values: const [
              'top\nstart',
              'top\ncenter',
              'top\nend',
              'center\nstart',
              'center',
              'center\nend',
              'bottom\nstart',
              'bottom\ncenter',
              'bottom\nend',
            ],
            disabled: _alignmentDisabled,
            onIndexChanged: widget.onUpdateAlignment,
          ),
        ),
      ],
    );
  }
}

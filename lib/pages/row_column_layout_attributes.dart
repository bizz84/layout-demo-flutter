import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_attribute_selector.dart';

class RowColumnLayoutAttributes extends StatelessWidget {
  const RowColumnLayoutAttributes({
    super.key,
    required this.onUpdateLayout,
    required this.onUpdateMainAxisAlignment,
    required this.onUpdateCrossAxisAlignment,
    required this.onUpdateMainAxisSize,
  });

  final ValueChanged<int> onUpdateLayout;
  final ValueChanged<int> onUpdateMainAxisAlignment;
  final ValueChanged<int> onUpdateCrossAxisAlignment;
  final ValueChanged<int> onUpdateMainAxisSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: 1,
            child: Column(children: <Widget>[
              LayoutAttributeSelector(
                title: 'Layout',
                values: const ['row', 'column'],
                onIndexChanged: onUpdateLayout,
              ),
              LayoutAttributeSelector(
                title: 'Main Axis Size',
                values: const ['min', 'max'],
                onIndexChanged: onUpdateMainAxisSize,
              ),
            ])),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              LayoutAttributeSelector(
                title: 'Main Axis Alignment',
                values: const [
                  'start',
                  'end',
                  'center',
                  'space\nbetween',
                  'space\naround',
                  'space\nevenly'
                ],
                onIndexChanged: onUpdateMainAxisAlignment,
              ),
              LayoutAttributeSelector(
                title: 'Cross Axis Alignment',
                values: const [
                  'start',
                  'end',
                  'center',
                  'stretch', /*'baseline'*/
                ],
                onIndexChanged: onUpdateCrossAxisAlignment,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

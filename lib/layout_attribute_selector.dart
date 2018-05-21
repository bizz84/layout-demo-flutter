import 'package:flutter/material.dart';

class LayoutAttributeSelector extends StatefulWidget {
  LayoutAttributeSelector({this.title, this.values, this.onChange});

  final String title;
  final List<String> values;
  final ValueChanged<int> onChange;

  @override
  State<StatefulWidget> createState() => LayoutAttributeSelectorState();
}

class LayoutAttributeSelectorState extends State<LayoutAttributeSelector> {
  int valueIndex = 0;

  void next() {
    valueIndex = valueIndex + 1 < widget.values.length ? valueIndex + 1 : 0;
    update();
  }

  void previous() {
    valueIndex = valueIndex > 0 ? valueIndex - 1 : widget.values.length - 1;
    update();
  }

  void update() {
    widget.onChange(valueIndex);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Divider(color: Colors.black54),
        Text(widget.title),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: previous,
            ),
            Text(
              widget.values[valueIndex],
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: next,
            ),
          ],
        ),
      ]),
    );
  }
}

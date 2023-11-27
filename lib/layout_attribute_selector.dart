import 'package:flutter/material.dart';

class LayoutAttributeSelector extends StatefulWidget {
  const LayoutAttributeSelector({
    super.key,
    required this.title,
    required this.values,
    this.disabled = false,
    required this.onIndexChanged,
  });

  final String title;
  final List<String> values;
  final bool disabled;
  final ValueChanged<int> onIndexChanged;

  @override
  State<StatefulWidget> createState() => LayoutAttributeSelectorState();
}

class LayoutAttributeSelectorState extends State<LayoutAttributeSelector> {
  var _valueIndex = 0;

  void _next() {
    _valueIndex = _valueIndex + 1 < widget.values.length ? _valueIndex + 1 : 0;
    _update();
  }

  void _previous() {
    _valueIndex = _valueIndex > 0 ? _valueIndex - 1 : widget.values.length - 1;
    _update();
  }

  void _update() {
    widget.onIndexChanged(_valueIndex);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Divider(color: Colors.black54),
      Text(widget.title),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            padding: const EdgeInsets.all(4.0),
            icon: const Icon(Icons.arrow_back),
            onPressed: widget.disabled ? null : _previous,
          ),
          Text(
            widget.values[_valueIndex],
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: widget.disabled ? Colors.black26 : Colors.black87,
            ),
          ),
          IconButton(
            padding: const EdgeInsets.all(4.0),
            icon: const Icon(Icons.arrow_forward),
            onPressed: widget.disabled ? null : _next,
          ),
        ],
      ),
    ]);
  }
}

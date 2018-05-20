import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_demo_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LayoutDemoPage(title: 'Layout Demo'),
    );
  }
}


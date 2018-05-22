import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarBuilder {
  static void _launchURL() async {
    const url = 'https://codingwithflutter.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static AppBar build({LayoutType layoutType, PreferredSize bottom}) {
    return AppBar(
      title: Text(layoutName(layoutType)),
      elevation: 1.0,
      actions: [
        IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: _launchURL,
        )
      ],
      bottom: bottom,
    );
  }
}

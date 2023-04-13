import 'package:flutter/material.dart';

class WebSettings extends StatefulWidget {
  const WebSettings({Key? key}) : super(key: key);

  @override
  State<WebSettings> createState() => _WebSettingsState();
}

class _WebSettingsState extends State<WebSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Web settings"),);
  }
}

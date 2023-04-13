import 'package:flutter/material.dart';

class TabletSettings extends StatefulWidget {
  const TabletSettings({Key? key}) : super(key: key);

  @override
  State<TabletSettings> createState() => _TabletSettingsState();
}

class _TabletSettingsState extends State<TabletSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Tablet Settings"),);
  }
}

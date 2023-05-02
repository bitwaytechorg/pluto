import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class MobileSettings extends StatefulWidget {
  const MobileSettings({Key? key}) : super(key: key);

  @override
  State<MobileSettings> createState() => _MobileSettingsState();
}

class _MobileSettingsState extends State<MobileSettings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Settings",),
      backgroundColor: CONFIG.primaryColor,
    ),
        body:SettingsList(
      sections: [
        SettingsSection(
          title: Text('Common', style: TextStyle(
            color: CONFIG.primaryColor
          ),),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Language'),
              value: Text('English'),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.cloud),
              title: Text('Environment'),
              value: Text('Production'),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.warehouse_sharp),
              title: Text('Platform'),
              value: Text('Default'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: false,
              leading: Icon(Icons.format_paint),
              title: Text('Enable custom theme'),
            ),
          ],
        ),
        SettingsSection(
          title: Text('Account', style: TextStyle(
            color: CONFIG.primaryColor
          ),),
            tiles:<SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.phone),
                title: Text('Phone No.'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.email_outlined),
                title: Text('Email'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.output_outlined),
                title: Text('Sign Out'),
              ),

            ])

      ],
        ),
    );
  }
}

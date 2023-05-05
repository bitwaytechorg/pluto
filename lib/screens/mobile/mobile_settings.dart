import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class MobileSettings extends StatefulWidget {
  const MobileSettings({Key? key}) : super(key: key);

  @override
  State<MobileSettings> createState() => _MobileSettingsState();
}

class _MobileSettingsState extends State<MobileSettings> {
  bool _toggleNotification= false;
  bool _toggleTheme= false;

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

            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                 _toggleNotification= value;
                });
              },
             initialValue:_toggleNotification,
              leading: Icon(Icons.notifications),
              title: Text('Notification'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  _toggleTheme= value;
                });
              },
              initialValue:_toggleTheme,
              leading: Icon(Icons.format_paint_outlined),
              title: Text('Theme'),
            ),
          ],
        ),
        SettingsSection(
          title: Text('Account', style: TextStyle(
            color: CONFIG.primaryColor
          ),),
            tiles:<SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.help_outline_outlined),
                title: Text('Help'),
              ),


            ])

      ],
        ),
    );
  }
}

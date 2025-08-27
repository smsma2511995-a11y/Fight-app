import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('الإعدادات'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('حول التطبيق'),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('خروج'),
          ),
        ],
      ),
    );
  }
}

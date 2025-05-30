import 'package:flutter/material.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(title: Text('Access Control and Privacy')),
        ListTile(title: Text('Alerts for unauthorized access')),
        ListTile(title: Text('Blocked Users')),
        ListTile(title: Text('Devices')),
      ],
    );
  }
}
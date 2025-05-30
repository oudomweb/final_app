import 'package:flutter/material.dart';

class ConnectivityScreen extends StatelessWidget {
  const ConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(title: Text('Connection Devices')),
        ListTile(title: Text('IoT Devices Integration')),
        ListTile(title: Text('Cloud Integration')),
        ListTile(title: Text('Edge Computing')),
      ],
    );
  }
}
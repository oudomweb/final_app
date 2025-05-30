import 'package:flutter/material.dart';

class SmartControlScreen extends StatelessWidget {
  const SmartControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.teal.shade900, Colors.grey[900]!],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('Home', style: TextStyle(color: Colors.white))),
          ListTile(title: Text('Connectivity and Protocols', style: TextStyle(color: Colors.white))),
          ListTile(title: Text('Security', style: TextStyle(color: Colors.white))),
          ListTile(title: Text('Settings', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
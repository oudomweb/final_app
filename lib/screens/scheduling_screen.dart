import 'package:flutter/material.dart';

class SchedulingScreen extends StatelessWidget {
  const SchedulingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(title: Text('Days'), subtitle: Text('Bedroom, Living Room, Others')),
        ListTile(title: Text('Times'), subtitle: Text('Select switch, select switch, ...')),
      ],
    );
  }
}
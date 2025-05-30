import 'package:flutter/material.dart';

class DeviceControlScreen extends StatefulWidget {
  const DeviceControlScreen({super.key});

  @override
  State<DeviceControlScreen> createState() => _DeviceControlScreenState();
}

class _DeviceControlScreenState extends State<DeviceControlScreen> {
  final Map<String, List<Map<String, dynamic>>> rooms = {
    'Bedroom': [
      {'name': 'Light', 'state': false},
      {'name': 'Fan', 'state': false},
    ],
    'Living Room': [
      {'name': 'TV', 'state': false},
      {'name': 'AC', 'state': false},
    ],
    'Kitchen': [
      {'name': 'Fridge', 'state': true},
      {'name': 'Oven', 'state': false},
    ],
    'Others': [
      {'name': 'Pump', 'state': false},
    ],
  };

  void _toggleDevice(String room, int index) {
    setState(() {
      rooms[room]![index]['state'] = !rooms[room]![index]['state'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: rooms.keys.map((room) {
        return Card(
          color: Colors.grey[800],
          child: ListTile(
            title: Text(room, style: const TextStyle(color: Colors.white)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: rooms[room]!.asMap().entries.map((entry) {
                int idx = entry.key;
                Map<String, dynamic> device = entry.value;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: SwitchListTile(
                    title: Text(device['name'], style: const TextStyle(color: Colors.white70)),
                    value: device['state'],
                    onChanged: (value) => _toggleDevice(room, idx),
                    activeColor: Colors.teal,
                  ),
                );
              }).toList(),
            ),
          ),
        );
      }).toList(),
    );
  }
}
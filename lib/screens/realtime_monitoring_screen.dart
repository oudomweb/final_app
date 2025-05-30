import 'package:flutter/material.dart';
import 'dart:async';

class RealTimeMonitoringScreen extends StatefulWidget {
  const RealTimeMonitoringScreen({super.key});

  @override
  State<RealTimeMonitoringScreen> createState() => _RealTimeMonitoringScreenState();
}

class _RealTimeMonitoringScreenState extends State<RealTimeMonitoringScreen> {
  // Simulated real-time data
  double voltage = 260;
  double current = 100;
  double power = 22.0;
  double energy = 700;
  double frequency = 65.00;

  // Switch states
  bool switch1 = false;
  bool switch2 = false;
  bool switch3 = false;

  // Timer to simulate real-time updates
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Simulate real-time data updates every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        voltage = (voltage + (1 - 2 * (DateTime.now().millisecond % 2))).clamp(250, 270);
        current = (current + (0.5 - (DateTime.now().millisecond % 2))).clamp(95, 105);
        power = (power + (0.1 - 0.2 * (DateTime.now().millisecond % 2))).clamp(20, 24);
        energy = (energy + 0.5).clamp(700, 710);
        frequency = (frequency + (0.01 - 0.02 * (DateTime.now().millisecond % 2))).clamp(64.5, 65.5);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Helper to create a gauge-like widget
  Widget _buildGauge(String label, double value, double maxValue, String unit) {
    double percentage = (value / maxValue).clamp(0, 1);
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.teal.shade900, Colors.teal.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: CircularProgressIndicator(
                value: percentage,
                strokeWidth: 10,
                backgroundColor: Colors.grey[700],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.teal),
              ),
            ),
            Text(
              '${value.toStringAsFixed(1)} $unit',
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
      ],
    );
  }

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
        children: [
          const Text(
            'Real-Time Monitoring',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Metrics',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildGauge('Voltage', voltage, 300, 'V'),
                      _buildGauge('Current', current, 150, 'A'),
                      _buildGauge('Power', power, 30, 'W'),
                      _buildGauge('Energy', energy, 1000, 'kWh'),
                      _buildGauge('Frequency', frequency, 70, 'Hz'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Device Control',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: SwitchListTile(
                      title: const Text('Switch 1', style: TextStyle(color: Colors.white)),
                      value: switch1,
                      onChanged: (value) {
                        setState(() {
                          switch1 = value;
                        });
                      },
                      activeColor: Colors.teal,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: SwitchListTile(
                      title: const Text('Switch 2', style: TextStyle(color: Colors.white)),
                      value: switch2,
                      onChanged: (value) {
                        setState(() {
                          switch2 = value;
                        });
                      },
                      activeColor: Colors.teal,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: SwitchListTile(
                      title: const Text('Switch 3', style: TextStyle(color: Colors.white)),
                      value: switch3,
                      onChanged: (value) {
                        setState(() {
                          switch3 = value;
                        });
                      },
                      activeColor: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
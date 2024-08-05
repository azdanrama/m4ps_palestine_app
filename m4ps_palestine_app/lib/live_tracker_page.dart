import 'package:flutter/material.dart';

class LiveTrackerPage extends StatelessWidget {
  const LiveTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Tracker Page'),
      ),
      body: const Center(
        child: Text('Live Tracker Content'),
      ),
    );
  }
}
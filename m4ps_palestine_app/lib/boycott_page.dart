import 'package:flutter/material.dart';

class BoycottPage extends StatelessWidget {
  const BoycottPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boycott Page'),
      ),
      body: const Center(
        child: Text('Boycott Page Content'),
      ),
    );
  }
}
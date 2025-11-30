import 'package:flutter/material.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({required this.name, super.key});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: 16),
        title: const Text('Tracking', style: TextStyle(fontSize: 18)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: Text(name)),
      ),
    );
  }
}

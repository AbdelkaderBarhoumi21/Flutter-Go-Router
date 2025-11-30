import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
       debugPrint('Build Settings Screen');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Settings', style: TextStyle(fontSize: 18)),
      ),
      body: const Center(child: Text('Settings Page')),
    );
  }
}

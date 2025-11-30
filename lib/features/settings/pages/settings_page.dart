import 'package:flutter/material.dart';
import 'package:flutter_go_router_mastering/core/routing/app_router.dart';
import 'package:flutter_go_router_mastering/core/routing/app_router_notifier.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Build Settings Screen');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Settings', style: TextStyle(fontSize: 18)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  appRouterNotifier.isLoggedIn = false;
                },
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

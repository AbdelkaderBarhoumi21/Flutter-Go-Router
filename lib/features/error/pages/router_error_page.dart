import 'package:flutter/material.dart';
import 'package:flutter_go_router_mastering/core/routing/app_route_paths.dart';
import 'package:go_router/go_router.dart';

class RouterErrorPage extends StatelessWidget {
  const RouterErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: 16),
        title: const Text('Error', style: TextStyle(fontSize: 18)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Route Error'),
            FilledButton.icon(
              onPressed: () {
                context.go(AppRoutePaths.loginPage);
              },
              label: Text('Go back'),
              icon: Icon(Icons.warning),
            ),
          ],
        ),
      ),
    );
  }
}

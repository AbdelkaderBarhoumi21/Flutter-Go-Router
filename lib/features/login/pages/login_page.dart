import 'package:flutter/material.dart';
import 'package:flutter_go_router_mastering/core/routing/app_route_names.dart';
import 'package:flutter_go_router_mastering/core/services/auth_service.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: 16),
        title: const Text('Login', style: TextStyle(fontSize: 18)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
      
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              // Persist login state
              await AuthService().login();
              // Navigate to dashboard (StatefulShellRoute)
              if (context.mounted) {
                context.goNamed(AppRouteNames.homePage);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: Text('Sign In'),
          ),
        ),
      ),
    );
  }
}

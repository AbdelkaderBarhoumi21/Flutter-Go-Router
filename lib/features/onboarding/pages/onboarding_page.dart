import 'package:flutter/material.dart';
import 'package:flutter_go_router_mastering/core/routing/app_route_names.dart';
import 'package:flutter_go_router_mastering/core/services/auth_service.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Onboarding', style: TextStyle(fontSize: 18)),
      ),
      body: const Center(child: Text('Onboarding Content')),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              // Mark onboarding as complete
              await AuthService().completeOnboarding();
              // Navigate to login page
              if (context.mounted) {
                context.goNamed(AppRouteNames.loginPage);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Get Started'),
          ),
        ),
      ),
    );
  }
}

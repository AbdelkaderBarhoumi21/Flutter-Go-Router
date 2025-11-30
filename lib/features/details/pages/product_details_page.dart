import 'package:flutter/material.dart';
import 'package:flutter_go_router_mastering/core/routing/app_route_names.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.name,
    required this.age,
    required this.updateName,
    super.key,
  });
  final String name;
  final int age;
  final Function(String) updateName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: 16),
        title: const Text('Details', style: TextStyle(fontSize: 18)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Details Screen'),
            const SizedBox(height: 16),
            Text('Name: $name - Age: $age'),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () =>
                  Navigator.pop(context, updateName("Hello world back again!")),
              child: Text('Update Name'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => context.pushNamed(
              AppRouteNames.trackingPage,
              pathParameters: {'name': 'Cat'},
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: Text('Tracking'),
          ),
        ),
      ),
    );
  }
}

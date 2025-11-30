import 'package:flutter/material.dart';
import 'package:flutter_go_router_mastering/core/routing/app_route_paths.dart';
import 'package:go_router/go_router.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    void updatedName(String value) => debugPrint(value);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,

        title: const Text('product', style: TextStyle(fontSize: 18)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              final extra = <String, dynamic>{
                'name': 'Abdelkader',
                'age': 30,
                'updatedName': updatedName,
              };
              context.push(AppRoutePaths.productDetailsPage, extra: extra);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: Text('Product Details'),
          ),
        ),
      ),
    );
  }
}

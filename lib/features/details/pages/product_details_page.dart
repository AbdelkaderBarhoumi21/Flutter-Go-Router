import 'package:flutter/material.dart';
import 'package:flutter_go_router_mastering/core/extension/app_router_extension.dart';
import 'package:flutter_go_router_mastering/core/routing/app_route_names.dart';
import 'package:flutter_go_router_mastering/core/routing/app_route_observer.dart';
import 'package:flutter_go_router_mastering/core/routing/app_route_paths.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatefulWidget {
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
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with RouteAware {
  late RouteObserver _routerObserver;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _routerObserver = appRouteObserver;
      _routerObserver.subscribe(this, ModalRoute.of(context)!);
    });
  }

  @override
  void dispose() {
    _routerObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {
    debugPrint('Product Details didPop');
    super.didPop();
  }

  @override
  Widget build(BuildContext context) {
    void updatedName(String value) => debugPrint(value);
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
            Text('Name: ${widget.name} - Age: ${widget.age}'),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => Navigator.pop(
                context,
                widget.updateName("Hello world back again!"),
              ),
              child: Text('Update Name'),
            ),
            const SizedBox(height: 16),
            GestureDetector(onTap: () => context.pop(), child: Text('Go back')),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                final currentRoute = GoRouter.of(context).currentRoute;
                if (currentRoute == AppRoutePaths.productDetailsPage) return;
                final extra = <String, dynamic>{
                  'name': 'Abdelkader',
                  'age': 30,
                  'updatedName': updatedName,
                };
                context.push(AppRoutePaths.productDetailsPage, extra: extra);
              },
              child: Text('Go To Details'),
            ),
          ],
        ),
      ),
    );
  }
}

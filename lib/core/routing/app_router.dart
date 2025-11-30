import 'package:flutter_go_router_mastering/core/routing/app_route_names.dart';
import 'package:flutter_go_router_mastering/core/routing/app_route_paths.dart';
import 'package:flutter_go_router_mastering/features/details/pages/product_details_page.dart';
import 'package:flutter_go_router_mastering/features/login/pages/login_page.dart';
import 'package:flutter_go_router_mastering/features/main/pages/main_page.dart';
import 'package:flutter_go_router_mastering/features/navigation/pages/app_navigation_page.dart';
import 'package:flutter_go_router_mastering/features/product/pages/product_page.dart';
import 'package:flutter_go_router_mastering/features/settings/pages/settings_page.dart';
import 'package:flutter_go_router_mastering/features/shop/pages/shop_page.dart';
import 'package:flutter_go_router_mastering/features/tracking/pages/tracking_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    // App Navigation (Bottom Nav)
    GoRoute(path: '/', builder: (context, state) => const AppNavigationPage()),
    // Main Page
    GoRoute(
      path: AppRoutePaths.mainPage,
      name: AppRouteNames.mainPage,
      builder: (context, state) => const MainPage(),
    ),
    // Login Page
    GoRoute(
      path: AppRoutePaths.loginPage,
      name: AppRouteNames.loginPage,
      builder: (context, state) => const LoginPage(),
    ),
    // Settings Page
    GoRoute(
      path: AppRoutePaths.settingsPage,
      name: AppRouteNames.settingsPage,
      builder: (context, state) => const SettingsPage(),
    ),

    // Product Page
    GoRoute(
      path: AppRoutePaths.productPage,
      name: AppRouteNames.productPage,
      builder: (context, state) => const ProductPage(),
      routes: <RouteBase>[
        // Details Page
        //sub router doesn't contain /
        GoRoute(
          path: AppRoutePaths.productDetailsPageSubRoute,
          name: AppRouteNames.productDetailsPage,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            final name = extra['name'] ?? 'Unknown';
            final age = extra['age'] ?? 'Unknown';
            final updatedName = extra['updatedName'] as Function(String);

            return DetailsPage(name: name, age: age, updateName: updatedName);
          },
        ),
      ],
    ),
    // Shop Page
    GoRoute(
      path: AppRoutePaths.shopPage,
      name: AppRouteNames.shopPage,
      builder: (context, state) => const ShopPage(),
    ),
    // Tracking Page
    GoRoute(
      path: AppRoutePaths.trackingPage,
      name: AppRouteNames.trackingPage,
      builder: (context, state) {
        final name = state.pathParameters['name'] ?? 'Unknown';

        return TrackingPage(name: name);
      },
    ),
  ],
);

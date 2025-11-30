import 'package:flutter_go_router_mastering/core/routing/app_route_names.dart';
import 'package:flutter_go_router_mastering/core/routing/app_route_paths.dart';
import 'package:flutter_go_router_mastering/core/services/auth_service.dart';
import 'package:flutter_go_router_mastering/features/dashboard/pages/dashboard_page.dart';
import 'package:flutter_go_router_mastering/features/details/pages/product_details_page.dart';
import 'package:flutter_go_router_mastering/features/home/pages/home_page.dart';
import 'package:flutter_go_router_mastering/features/login/pages/login_page.dart';
import 'package:flutter_go_router_mastering/features/main/pages/main_page.dart';
import 'package:flutter_go_router_mastering/features/onboarding/pages/onboarding_page.dart';
import 'package:flutter_go_router_mastering/features/product/pages/product_page.dart';
import 'package:flutter_go_router_mastering/features/settings/pages/settings_page.dart';
import 'package:flutter_go_router_mastering/features/shop/pages/shop_page.dart';
import 'package:flutter_go_router_mastering/features/tracking/pages/tracking_page.dart';
import 'package:go_router/go_router.dart';

final _authService = AuthService();

final appRouter = GoRouter(
  initialLocation: AppRoutePaths.loginPage,
  redirect: (context, state) async {
    // debugPrint(state.name);
    // debugPrint('Full Path: ${state.fullPath}');
    // debugPrint('Path: ${state.path}');
    // debugPrint(state.matchedLocation);
    // debugPrint(state.pathParameters.toString());
    // debugPrint(state.extra.toString());
    // debugPrint(state.pageKey.toString());

    // Check authentication state from persistent storage
    final isFirstTime = await _authService.isFirstTime();
    final isLoggedIn = await _authService.isLoggedIn();
    //matchedLocation	Chemin de la route matchée	/productPage/productDetailsPage
    //path	Définition du chemin de la route	productDetailsPage
    //fullPath	Chemin complet avec params	/productPage/productDetailsPage?id=123
    //name	Nom de la route	'productDetailsPage'
    // Get current path to avoid redirect loops
    final currentPath = state.matchedLocation;

    // If first time, show onboarding (unless already there)
    if (isFirstTime && currentPath != AppRoutePaths.onboardingPage) {
      return AppRoutePaths.onboardingPage;
    }

    // If logged in, go to dashboard home (unless already on dashboard pages)
    if (isLoggedIn && currentPath == AppRoutePaths.loginPage) {
      return AppRoutePaths.homePage; // First branch of StatefulShellRoute
    }

    // If not logged in and not first time, ensure user is on login or onboarding
    if (!isLoggedIn &&
        !isFirstTime &&
        currentPath != AppRoutePaths.loginPage &&
        currentPath != AppRoutePaths.onboardingPage) {
      return AppRoutePaths.loginPage;
    }

    return null; // No redirect needed
  },
  routes: <RouteBase>[
    // Onboarding Page
    GoRoute(
      path: AppRoutePaths.onboardingPage,
      name: AppRouteNames.onboardingPage,
      builder: (context, state) => const OnboardingPage(),
    ),
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

    // Tracking Page
    GoRoute(
      path: AppRoutePaths.trackingPage,
      name: AppRouteNames.trackingPage,
      builder: (context, state) {
        final name = state.pathParameters['name'] ?? 'Unknown';

        return TrackingPage(name: name);
      },
    ),

    // Dashboard page(Nav bar with StatefulShell)
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return DashboardPage(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        //bottom tab - 1 => Home Page
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutePaths.homePage,
              name: AppRouteNames.homePage,
              builder: (context, state) {
                return const HomePage();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            //bottom tab - 2  => Product Page
            GoRoute(
              path: AppRoutePaths.productPage,
              name: AppRouteNames.productPage,
              builder: (context, state) => const ProductPage(),
              routes: <RouteBase>[
                // Details Page
                //sub router doesn't contain  => Product Details Page
                GoRoute(
                  path: AppRoutePaths.productDetailsPageSubRoute,
                  name: AppRouteNames.productDetailsPage,
                  builder: (context, state) {
                    final extra = state.extra as Map<String, dynamic>;
                    final name = extra['name'] ?? 'Unknown';
                    final age = extra['age'] ?? 'Unknown';
                    final updatedName =
                        extra['updatedName'] as Function(String);

                    return DetailsPage(
                      name: name,
                      age: age,
                      updateName: updatedName,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            //bottom tab - 3  => Shop Page
            GoRoute(
              path: AppRoutePaths.shopPage,
              name: AppRouteNames.shopPage,
              builder: (context, state) {
                return const ShopPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            //bottom tab - 4  => Settings Page
            GoRoute(
              path: AppRoutePaths.settingsPage,
              name: AppRouteNames.settingsPage,
              builder: (context, state) {
                return const SettingsPage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

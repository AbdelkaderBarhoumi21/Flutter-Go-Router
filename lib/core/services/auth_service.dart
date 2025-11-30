import 'package:shared_preferences/shared_preferences.dart';

/// Service to manage authentication state with persistent storage
class AuthService {
  static const String _keyIsLoggedIn = 'isLoggedIn';
  static const String _keyIsFirstTime = 'isFirstTime';

  /// Check if user is logged in
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  /// Check if this is user's first time opening the app
  Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsFirstTime) ?? true;
  }

  /// Log in the user - sets isLoggedIn to true and isFirstTime to false
  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, true);
    await prefs.setBool(_keyIsFirstTime, false);
  }

  /// Log out the user
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, false);
  }

  /// Mark onboarding as completed
  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsFirstTime, false);
  }

  /// Clear all auth data (useful for testing or full reset)
  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyIsLoggedIn);
    await prefs.remove(_keyIsFirstTime);
  }
}

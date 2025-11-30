import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider to manage the selected navigation index
final navigationIndexProvider = StateProvider<int>((ref) => 0);


import 'package:flutter/material.dart';
import 'package:ten_twenty_asssignment/entry_point.dart';
import 'package:ten_twenty_asssignment/screens/screens.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return SplashScreenPage.route();

      case '/entryPoint':
        return EntryPoint.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Error Fetching Data"),
          ),
        ),
        settings: const RouteSettings(name: '/error'));
  }
}
import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route(){
    return MaterialPageRoute(builder : (_)=> const SplashScreenPage(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, '/entryPoint'));
    return  const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("Ten Twenty Assignment"),
          )
        ));
  }
}

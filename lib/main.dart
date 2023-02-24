import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_twenty_asssignment/provider/multi_providers.dart';
import 'package:ten_twenty_asssignment/resource/resource.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: multiProviders,
      child: MaterialApp(
        title: 'TenTwenty Assignment',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGeneratedRoute,
        initialRoute: SplashScreenPage.routeName,
      ),
    );
  }
}

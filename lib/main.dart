import 'package:flutter/material.dart';
import 'package:news_app_route/view/home/home_screen.dart';

import 'core/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
    debugShowCheckedModeBanner: false,
    initialRoute: HomeScreen.routeName,
    routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
    },
    );
  }
}



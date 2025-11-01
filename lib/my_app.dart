import 'package:flutter/material.dart';
import 'package:week6_task/config/theme/light_theme.dart';
import 'package:week6_task/core/route/app_route.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_task/config/theme/dark_theme.dart';
import 'package:week6_task/config/theme/light_theme.dart';
import 'package:week6_task/config/theme/theme_cubit/theme_cubit.dart';
import 'package:week6_task/config/theme/theme_cubit/theme_states.dart';
import 'package:week6_task/core/route/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: state is ThemeDark ? ThemeMode.dark : ThemeMode.light,
            onGenerateRoute: AppRoute.generateRoute,
          );
        },
      ),
    );
  }
}

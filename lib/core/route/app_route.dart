
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_task/core/dependancy_injection/dependancyinjection.dart';
import 'package:week6_task/features/home/presentation/home_cubit/home_cubit.dart';
import 'package:week6_task/features/home/presentation/home_screen.dart';

class AppRoute {

 static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>BlocProvider(
          create: (context) =>  HomeCubit(homeRepository: getIt())..getHomeData(),
          child: const HomeScreen()));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  } 
}
import 'package:flutter/material.dart';
import 'package:week6_task/core/dependancy_injection/dependancyinjection.dart';
import 'package:week6_task/my_app.dart';


void main() {
  AppDependencyInjection.setup();
  print("hello development flavor");
  runApp(const MyApp());
}

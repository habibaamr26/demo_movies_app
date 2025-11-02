import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:week6_task/config/cashing/hive_cashing.dart';
import 'package:week6_task/config/cashing/shared_preferences.dart';
import 'package:week6_task/core/dependancy_injection/dependancyinjection.dart';
import 'package:week6_task/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveCache.init();
  await AppDependencyInjection.setup();
  print("hello development flavor");
  runApp(const MyApp());
}

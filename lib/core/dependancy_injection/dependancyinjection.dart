

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:week6_task/core/networking/dio_factory.dart';
import 'package:week6_task/features/home/data/data_sorce/api_data.dart';
import 'package:week6_task/features/home/data/repository/home_repo.dart';
import 'package:week6_task/features/home/presentation/home_cubit/home_cubit.dart';

GetIt getIt = GetIt.instance;

abstract class AppDependencyInjection { 

   static void setup() {
    setupDependencyInjection();
   }
}


void setupDependencyInjection() {
  // Setup your dependencies here
 getIt.registerLazySingleton<Dio>(() => AppDioFactory().getDio());
  getIt.registerLazySingleton<HomeApiDataSource>(() => HomeApiDataSource( getIt<Dio>()));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository( apiDataSource: getIt<HomeApiDataSource>()));
  getIt.registerFactory(() => HomeCubit(homeRepository: getIt<HomeRepository>()));
}

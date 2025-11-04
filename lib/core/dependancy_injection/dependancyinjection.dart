import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:week6_task/config/cashing/hive_cashing.dart';
import 'package:week6_task/config/cashing/shared_preferences.dart';
import 'package:week6_task/config/theme/theme_cubit/theme_cubit.dart';
import 'package:week6_task/core/networking/dio_factory.dart';
import 'package:week6_task/features/home/data/data_sorce/apis/api_data.dart';
import 'package:week6_task/features/home/data/data_sorce/apis/movies_local_data_storage.dart';
import 'package:week6_task/features/home/data/repository/home_repo.dart';
import 'package:week6_task/features/home/presentation/home_cubit/home_cubit.dart';

GetIt getIt = GetIt.instance;

abstract class AppDependencyInjection {
  static Future<void> setup() async {
    setupDependencyInjection();
    await themeDependencyInjection();
  }
}

void setupDependencyInjection() {
  getIt.registerLazySingleton<Dio>(() => AppDioFactory().getDio());
  getIt.registerLazySingleton<HomeApiDataSource>(
    () => HomeApiDataSource(getIt<Dio>()),
  );

  getIt.registerLazySingleton<HiveCache>(() => HiveCache());
  getIt.registerLazySingleton<MoviesLocalDataSource>(
    () => MoviesLocalDataSourceImpl(hiveCache: getIt<HiveCache>()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepository(
      apiDataSource: getIt<HomeApiDataSource>(),
      localDataSource: getIt<MoviesLocalDataSource>(),
    ),
  );
  getIt.registerFactory(
    () => HomeCubit(homeRepository: getIt<HomeRepository>()),
  );
}

Future<void> themeDependencyInjection() async {
  await SharedPreferencesCashing.initSharedPreferences();
  getIt.registerLazySingleton<SharedPreferencesCashing>(
    () => SharedPreferencesCashing(),
  );
  getIt.registerFactory(() => ThemeCubit(getIt<SharedPreferencesCashing>()));
}

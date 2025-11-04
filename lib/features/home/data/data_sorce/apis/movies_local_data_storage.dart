// products_local_datasource.dart
import 'dart:convert';
import 'package:week6_task/config/cashing/hive_cashing.dart';
import 'package:week6_task/features/home/data/models/home_data_response_model.dart';

abstract class MoviesLocalDataSource {
  Future<void> cacheMovies(int page,Map<String, dynamic> json);
  Future<HomeDataResponseModel?> getCachedMovies(int page);
}

class MoviesLocalDataSourceImpl implements MoviesLocalDataSource {
  HiveCache? hiveCache;
  MoviesLocalDataSourceImpl({this.hiveCache});

  @override
  Future<void> cacheMovies(int page,Map<String, dynamic> json) async {
   try {
      await hiveCache!.addData('movies_response_$page', jsonEncode(json));
    } catch (e) {
      print('Error caching movies: $e');
    }
  }

  @override
  Future<HomeDataResponseModel?> getCachedMovies(int page) async {
    try {
      final cachedJson = hiveCache!.getData<String>('movies_response_$page');
      if (cachedJson != null) {
        final decoded = jsonDecode(cachedJson);
        return HomeDataResponseModel.fromJson(decoded);
      }
    } catch (e) {
      print('Error getting cached movies: $e');
    }
    return null;
  }
}

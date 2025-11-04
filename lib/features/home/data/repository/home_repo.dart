

import 'package:get_it/get_it.dart';
import 'package:week6_task/core/networking/result.dart';
import 'package:week6_task/features/home/data/data_sorce/apis/api_data.dart';
import 'package:week6_task/features/home/data/data_sorce/apis/movies_local_data_storage.dart';
import 'package:week6_task/features/home/data/models/home_data_response_model.dart';

class HomeRepository {
  HomeApiDataSource apiDataSource;
  MoviesLocalDataSource localDataSource;
  HomeRepository({required this.apiDataSource, required this.localDataSource});

  Future<ApiResult<HomeDataResponseModel>> getHomeData({required int page}) async {
    try {
      final cachedData = await localDataSource.getCachedMovies(page);
      if (cachedData != null) {
        return ApiResult.success(cachedData);
      }
      final response = await apiDataSource.fetchHomeData(page: page);
      await localDataSource.cacheMovies(page, response.toJson());
      return ApiResult.success(response);
    } catch (error) {
      try {
        final cachedData = await localDataSource.getCachedMovies(page);
        if (cachedData != null) {
          return ApiResult.success(cachedData);
        }
      } catch (_) {}
      return ApiResult.error(error);
    }
  }

    
}
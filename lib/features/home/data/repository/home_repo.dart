

import 'package:get_it/get_it.dart';
import 'package:week6_task/core/networking/result.dart';
import 'package:week6_task/features/home/data/data_sorce/apis/api_data.dart';
import 'package:week6_task/features/home/data/models/home_data_response_model.dart';

class HomeRepository {
  HomeApiDataSource apiDataSource;
  HomeRepository({required this.apiDataSource});

  Future<ApiResult<HomeDataResponseModel>> getHomeData({required int page}) async {
     try {
      final response = await  apiDataSource.fetchHomeData(page: page);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.error(error);
    }
    
  }

    
}
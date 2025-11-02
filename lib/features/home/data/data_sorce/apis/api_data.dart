import 'package:retrofit/http.dart';
import 'package:week6_task/core/networking/network_constant.dart';
import 'package:dio/dio.dart';
import 'package:week6_task/features/home/data/models/home_data_response_model.dart';

part 'api_data.g.dart';

@RestApi(baseUrl: AppNetworkConstant.baseUrl)
abstract class HomeApiDataSource {
  factory HomeApiDataSource(Dio dio, {String baseUrl}) = _HomeApiDataSource;


  @GET('popular')
  Future<HomeDataResponseModel> fetchHomeData({
    @Query('language') String language = 'en-US',
    @Query('page') required int page,
  });
}



import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class AppDioFactory {
  AppDioFactory._();
   static AppDioFactory _instance = AppDioFactory._();

  factory AppDioFactory() {
    return _instance;
  }


  Dio? _dio;




  Dio getDio() {
    const Duration timeOut = Duration(seconds: 30);
    if (_dio == null) {
      _dio = Dio(BaseOptions(
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMzM2Mjk4NTA5NzdjMmY0NjI3NTNlZWQwYjM1M2QxMCIsIm5iZiI6MTc2MTkyNDAwMS40NDk5OTk4LCJzdWIiOiI2OTA0ZDNhMTQ3MjcwZWI4MjQ0NzFlZjkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.mUqVcDE3LJ6Eu0kSI1lRprocK2ZVE2pK_ajZ64QtDpc',
          'accept': 'application/json',
        },
      ));

      addDioInterceptor();
    }
    return _dio!;
  }
  void addDioInterceptor() {
    _dio?.interceptors.addAll([
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
         
    ]);
  }

  void reset() {
    _dio?.close();
    _dio = null;
  }



}
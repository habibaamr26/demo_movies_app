

import 'package:week6_task/features/home/data/models/home_data_response_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeDataLoadingState extends HomeState {}
  
class HomeDataMaxPageState extends HomeState {}

class HomeDataSuccessState extends HomeState {
  final List<HomeDataResultModel> homeDataList;

  HomeDataSuccessState({required this.homeDataList});
}

class HomeDataErrorState extends HomeState {
  final String errorMessage;

  HomeDataErrorState({required this.errorMessage});
}
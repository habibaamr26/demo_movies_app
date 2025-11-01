
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_task/features/home/data/models/home_data_response_model.dart';
import 'package:week6_task/features/home/data/repository/home_repo.dart';
import 'package:week6_task/features/home/presentation/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;

  HomeCubit({required this.homeRepository}) : super(HomeInitial());

 
  List<HomeDataResultModel> homeDataList = [];
 int page = 1;
  getHomeData() async {
    if (page == 1) {
      emit(HomeDataLoadingState());
    }
    if (page == 500) {
      emit(HomeDataMaxPageState());
      return;
    }
    final result = await homeRepository.getHomeData(page: page);
    result.when(
      onSuccess: (data) {
        homeDataList.addAll(data.results!);
        emit(HomeDataSuccessState(homeDataList: homeDataList));
      },
      onError: (error) {
        emit(HomeDataErrorState(errorMessage: error.message ?? "Something went wrong"));

      },
    );
  }
}

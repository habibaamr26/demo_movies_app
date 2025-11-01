
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_task/features/home/data/models/home_data_response_model.dart';
import 'package:week6_task/features/home/data/repository/home_repo.dart';
import 'package:week6_task/features/home/presentation/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;

  HomeCubit({required this.homeRepository}) : super(HomeInitial());

 
  List<HomeDataResultModel> homeDataList = [];
 int page = 1;
  bool isLoadingMore = false;
  bool hasReachedMax = false;

  Future<void> getHomeData() async {
    if (isLoadingMore || hasReachedMax) return;
    if (page == 1) {
      emit(HomeDataLoadingState());
    } else {
      isLoadingMore = true;
    }
    final result = await homeRepository.getHomeData(page: page);
    result.when(
      onSuccess: (data) {

        isLoadingMore = false;
         if (data.results == null || data.results!.isEmpty) {
          hasReachedMax = true;
          emit(HomeDataMaxPageState(homeDataList: homeDataList));
          return;
        }

        homeDataList.addAll(data.results!);
        page++;
        emit(HomeDataSuccessState(homeDataList: homeDataList));
      },
      onError: (error) {
         isLoadingMore = false;
        emit(HomeDataErrorState(errorMessage: error.message ?? "Something went wrong"));
      },
    );
  }
}

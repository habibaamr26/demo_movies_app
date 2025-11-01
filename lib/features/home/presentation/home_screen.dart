import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_task/features/home/presentation/home_cubit/home_cubit.dart';
import 'package:week6_task/features/home/presentation/home_cubit/home_state.dart';
import 'package:week6_task/features/home/presentation/widgets/home_big_image_stack.dart';
import 'package:week6_task/features/home/presentation/widgets/home_header.dart';
import 'package:week6_task/features/home/presentation/widgets/list_item_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              HomeHeader(),
              HomeBigImageStack(),
              const SizedBox(height: 15.0),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final cubit=context.read<HomeCubit>();
                  if (state is HomeDataLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is HomeDataErrorState) {
                    return Center(child: Text(state.errorMessage.toString()));
                  } else if(state is HomeDataMaxPageState)
                  {
                     return Center(child: Text("no more data to get "));
                  }
                  else if (state is HomeDataSuccessState) {
                    return NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if(scrollNotification.metrics.pixels==scrollNotification.metrics.maxScrollExtent)
                        {
                          print(scrollNotification);
                           print(cubit.page);
                          cubit.page++;
                          cubit.getHomeData();
                        }
                        return false;
                      },
                      child: Expanded(
                        child: ListView.builder(
                                  
                          itemCount: state.homeDataList.length,
                          itemBuilder: (context, index) {
                            final item = state.homeDataList[index];
                            return ListItemBuilder(item: item);
                          },
                        ),
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

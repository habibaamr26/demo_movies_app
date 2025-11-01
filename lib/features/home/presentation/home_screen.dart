import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_task/features/home/presentation/home_cubit/home_cubit.dart';
import 'package:week6_task/features/home/presentation/home_cubit/home_state.dart';
import 'package:week6_task/features/home/presentation/widgets/home_big_image_stack.dart';
import 'package:week6_task/features/home/presentation/widgets/home_header.dart';
import 'package:week6_task/features/home/presentation/widgets/list_item_builder.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final cubit = context.read<HomeCubit>();
      if (cubit.state is! HomeDataLoadingState) {
        cubit.getHomeData();
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: HomeHeader(),
              ),
             
              SliverToBoxAdapter(
                child: HomeBigImageStack(),
              ),
              // Spacing
              const SliverToBoxAdapter(
                child: SizedBox(height: 15.0),
              ),
              // List as sliver
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeDataLoadingState) {
                    return const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is HomeDataErrorState) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(state.errorMessage.toString())),
                    );
                  } else if (state is HomeDataSuccessState) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final item = state.homeDataList[index];
                          return ListItemBuilder(item: item);
                        },
                        childCount: state.homeDataList.length,
                      ),
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
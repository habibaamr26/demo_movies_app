

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_task/config/theme/theme_cubit/theme_states.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(AppTheme.light));
  
  void toggleTheme() {
    final newTheme=state.isDark ? AppTheme.light : AppTheme.dark;
  
      emit(ThemeState(newTheme));
   
  }
  bool get isDark => state.isDark;

}
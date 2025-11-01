

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_task/config/theme/theme_cubit/theme_states.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool isDark = false;

  void themeSwitch() {
    if (isDark) {
    emit(ThemeDark());
    } else {
      emit(ThemeLight());
    }
    isDark = !isDark;
  }

}
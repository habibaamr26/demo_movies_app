import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_task/config/cashing/shared_preferences.dart';
import 'package:week6_task/config/theme/theme_cubit/theme_states.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferencesCashing _localDataStorage;

  ThemeCubit(this._localDataStorage) : super(ThemeState(AppTheme.light)) {
    loadTheme();
  }

  void toggleTheme() {
    final newTheme = state.isDark ? AppTheme.light : AppTheme.dark;
    saveThemePreference(newTheme);
    emit(ThemeState(newTheme));
  }

  void loadTheme() {
    final theme = _localDataStorage.getData('Theme') as String? ?? 'light';
    final cashingTheme = theme == 'dark' ? AppTheme.dark : AppTheme.light;
    emit(ThemeState(cashingTheme));
  }

  void saveThemePreference(newTheme) {
    if (newTheme == AppTheme.dark) {
      _localDataStorage.addData('Theme', 'dark');
    } else {
      _localDataStorage.addData('Theme', 'light');
    }
  }

  bool get isDark => state.isDark;
}



enum AppTheme { light, dark }

class ThemeState {
  final AppTheme theme;

  ThemeState(this.theme);
  bool get isDark => theme == AppTheme.dark;
}
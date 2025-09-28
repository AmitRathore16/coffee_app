import 'notifier.dart';

class ThemeState extends Notifier {
  bool _isDark = false;

  bool get isDark => _isDark;
  void setDark(bool v) {
    _isDark = v;
    notifyListeners();
  }

  void toggle() {
    _isDark = !_isDark;
    notifyListeners();
  }

}

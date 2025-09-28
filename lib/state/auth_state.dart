import 'package:coffee/api/api_client.dart';
import 'package:coffee/models/user.dart';
import 'notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthState extends Notifier {
  final MockAuthService _authService = MockAuthService();

  User? _currentUser;

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;

  Future<bool> login(String email, String password) async {
    final user = await _authService.login(email, password);
    if (user != null) {
      _currentUser = user;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.token ?? '');

      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _currentUser = null;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}

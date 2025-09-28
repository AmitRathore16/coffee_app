import 'dart:async';
import '../models/user.dart';

class MockAuthService {
  Future<User?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email.isNotEmpty && password.isNotEmpty) {
      return User(
        id: '123',
        name: 'Coffee Lover',
        email: email,
        token: 'mock_token_abc123',
      );
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import 'cart_state.dart';
import 'auth_state.dart';
import 'theme_state.dart';
import 'combined_notifier.dart';

class AppState extends InheritedNotifier<ChangeNotifier> {
  final CartState cart;
  final AuthState auth;
  final ThemeState theme;

  AppState({
    Key? key,
    required this.cart,
    required this.auth,
    required this.theme,
    required Widget child,
  }) : super(
    key: key,
    notifier: CombinedNotifier([cart, auth, theme]),
    child: child,
  );

  static AppState of(BuildContext context) {
    final AppState? result =
    context.dependOnInheritedWidgetOfExactType<AppState>();
    assert(result != null, 'No AppState found in context');
    return result!;
  }
}

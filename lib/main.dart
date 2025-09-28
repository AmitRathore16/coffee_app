import 'package:coffee/models/products.dart';
import 'package:coffee/screens/cart.dart';
import 'package:coffee/screens/login.dart';
import 'package:coffee/screens/order.dart';
import 'package:coffee/screens/product_details.dart';
import 'package:coffee/api/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helpers/bottom_bar.dart';
import 'theme/app_theme.dart';
import 'state/app_state.dart';
import 'state/cart_state.dart';
import 'state/auth_state.dart';
import 'state/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? '';
  final isLoggedIn = token.isNotEmpty;

  await CartManager().loadCart();

  final appState = AppState(
    cart: CartState(),
    auth: AuthState(),
    theme: ThemeState(),
    child: CoffeeApp(isLoggedIn: isLoggedIn),
  );

  runApp(appState);
}

class CoffeeApp extends StatefulWidget {
  final bool isLoggedIn;

  const CoffeeApp({super.key, required this.isLoggedIn});

  @override
  State<CoffeeApp> createState() => _CoffeeAppState();
}

class _CoffeeAppState extends State<CoffeeApp> {
  bool isDark = false;

  void toggleDarkMode() {
    setState(() {
      isDark = !isDark;
      AppTheme.setDarkMode(isDark);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop App',
      theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: widget.isLoggedIn
          ? BottomBar(
        isDarkMode: isDark,
        onThemeToggle: toggleDarkMode,
      )
          : const LoginScreen(),
      routes: {
        '/login': (_) => const LoginScreen(),
        '/order': (_) => const Order(),
        Cart.routeName: (_) => const Cart(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          return MaterialPageRoute(
            builder: (_) => BottomBar(
              isDarkMode: isDark,
              onThemeToggle: toggleDarkMode,
            ),
          );
        }
        if (settings.name == ProductDetails.routeName) {
          final product = settings.arguments as Product;
          return MaterialPageRoute(
            builder: (_) => ProductDetails(product: product),
          );
        }
        return null;
      },
    );
  }
}

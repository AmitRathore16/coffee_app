import 'dart:convert';
import 'package:coffee/models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartManager {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;

  CartManager._internal();

  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('cart_items');
    if (data != null) {
      final decoded = jsonDecode(data) as List;
      _items = decoded.map((e) => CartItem.fromJson(e)).toList();
    }
  }

  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(_items.map((e) => e.toJson()).toList());
    await prefs.setString('cart_items', encoded);
  }

  void addItem(CartItem item) {
    final index = _items.indexWhere((e) => e.id == item.id);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(item);
    }
    saveCart();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    saveCart();
  }

  void clearCart() {
    _items.clear();
    saveCart();
  }

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);
}

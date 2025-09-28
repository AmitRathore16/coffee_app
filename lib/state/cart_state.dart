import 'package:coffee/models/cart_item.dart';
import 'package:coffee/api/cart_service.dart';
import 'notifier.dart';

class CartState extends Notifier {
  final CartManager _cartManager = CartManager();

  List<CartItem> get items => _cartManager.items;
  double get totalPrice => _cartManager.totalPrice;

  Future<void> loadCart() async {
    await _cartManager.loadCart();
    notifyListeners();
  }

  void addItem(CartItem item) {
    _cartManager.addItem(item);
    notifyListeners();
  }

  void removeItem(String id) {
    _cartManager.removeItem(id);
    notifyListeners();
  }

  void clear() {
    _cartManager.clearCart();
    notifyListeners();
  }
}

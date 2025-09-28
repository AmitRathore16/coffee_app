import 'package:coffee/models/products.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavouriteManager {
  static final FavouriteManager _instance = FavouriteManager._internal();
  factory FavouriteManager() => _instance;
  FavouriteManager._internal();

  static const String _key = "favourite_products";
  List<Product> _favourites = [];

  List<Product> get favourites => _favourites;

  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final favData = prefs.getStringList(_key) ?? [];
    _favourites = favData
        .map((item) => Product.fromJson(json.decode(item)))
        .toList();
  }

  Future<void> toggleFavourite(Product product) async {
    final prefs = await SharedPreferences.getInstance();
    if (isFavourite(product)) {
      _favourites.removeWhere((p) => p.title == product.title);
    } else {
      _favourites.add(product);
    }
    final favData = _favourites.map((p) => json.encode(p.toJson())).toList();
    await prefs.setStringList(_key, favData);
  }

  bool isFavourite(Product product) {
    return _favourites.any((p) => p.title == product.title);
  }
}

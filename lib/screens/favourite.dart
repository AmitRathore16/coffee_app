import 'package:coffee/api/cart_service.dart';
import 'package:coffee/api/favourite_service.dart';
import 'package:coffee/models/cart_item.dart';
import 'package:coffee/widgets/coffee_card.dart';
import 'package:flutter/material.dart';
import 'package:coffee/theme/app_theme.dart';

class FavouriteScreen extends StatefulWidget {
  static String routeName = '/favourites';

  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final favManager = FavouriteManager();

  @override
  void initState() {
    super.initState();
    favManager.loadFavourites().then((_) {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    final favourites = favManager.favourites;
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favourites", style: AppTheme.appBarTitle),
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: AppTheme.textColorPrimary),
      ),
      body: favourites.isEmpty
          ? const Center(child: Text("No favourites yet"))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                final product = favourites[index];
                return CoffeeCard(
                  product: product,
                  onAdd: () {
                    final cartItem = CartItem(
                      id: product.title,
                      name: product.title,
                      imageUrl: product.image,
                      price: product.price,
                      quantity: 1,
                    );
                    CartManager().addItem(cartItem);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${product.title} added to cart"),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

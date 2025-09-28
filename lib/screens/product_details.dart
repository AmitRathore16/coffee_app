import 'package:coffee/api/favourite_service.dart';
import 'package:coffee/helpers/read_more.dart';
import 'package:coffee/models/cart_item.dart';
import 'package:coffee/models/products.dart';
import 'package:coffee/screens/cart.dart';
import 'package:coffee/api/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:coffee/theme/app_theme.dart';

class ProductDetails extends StatefulWidget {
  static String routeName = '/product-details';
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String selectedSize = "M";
  int quantity = 1;

  Widget _buildQuantityStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Quantity",
          style: AppTheme.quantityLabelText,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (quantity > 1) {
                  setState(() {
                    quantity--;
                  });
                }
              },
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.borderColor, width: 1),
                  borderRadius: BorderRadius.circular(12),
                  color: AppTheme.backgroundColor,
                ),
                child: Icon(
                  Icons.remove,
                  color: AppTheme.textColorPrimary,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 16),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Text(
                quantity.toString(),
                key: ValueKey<int>(quantity),
                style: AppTheme.quantityValueText,
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                setState(() {
                  quantity++;
                });
              },
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.borderColor, width: 1),
                  borderRadius: BorderRadius.circular(12),
                  color: AppTheme.backgroundColor,
                ),
                child: Icon(
                  Icons.add,
                  color: AppTheme.textColorPrimary,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeButton(String size) {
    final bool isSelected = selectedSize == size;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        width: 105,
        height: 41,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primaryColor.withOpacity(0.1)
              : AppTheme.backgroundColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppTheme.primaryColor
                : AppTheme.borderColor,
            width: 1,
          ),
        ),
        child: Text(
          size,
          style: isSelected
              ? AppTheme.sizeButtonSelected
              : AppTheme.sizeButtonUnselected,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  color: AppTheme.textColorPrimary,
                  iconSize: 28,
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  "Detail",
                  style: AppTheme.appBarTitle,
                ),
                IconButton(
                  icon: Icon(
                    FavouriteManager().isFavourite(product)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: FavouriteManager().isFavourite(product)
                        ? Colors.red
                        : AppTheme.textColorPrimary,
                  ),
                  iconSize: 28,
                  onPressed: () async {
                    await FavouriteManager().toggleFavourite(product);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            AspectRatio(
              aspectRatio: 327 / 202,
              child: Hero(
                tag: "product-image-${product.title}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(product.image, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 30,
              width: double.infinity,
              child: Text(
                product.title,
                style: AppTheme.productTitle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.subtitle,
                  style: AppTheme.productSubtitle,
                ),
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppTheme.lightGrayBackground.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Image(
                        image: AssetImage('assets/delivery.jpeg'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 44,
                      height: 44,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppTheme.lightGrayBackground.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Image(image: AssetImage('assets/bean.png')),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 44,
                      height: 44,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppTheme.lightGrayBackground.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Image(image: AssetImage('assets/milk.png')),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                const Icon(Icons.star, color: AppTheme.ratingColor, size: 20),
                const SizedBox(width: 4),
                Text(
                  product.rating.toStringAsFixed(1),
                  style: AppTheme.ratingText,
                ),
                const SizedBox(width: 4),
                Text(
                  "(230)",
                  style: AppTheme.ratingCount,
                ),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 295,
              child: Divider(color: AppTheme.borderColor, thickness: 1, height: 0),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 24,
              width: 98,
              child: Text(
                "Description",
                style: AppTheme.cardTitle,
              ),
            ),
            const SizedBox(height: 8),
            ReadMoreText(
              text: product.description,
              style: AppTheme.descriptionText,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 81,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Size",
                    style: AppTheme.cardTitle,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSizeButton("S"),
                      _buildSizeButton("M"),
                      _buildSizeButton("L"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            _buildQuantityStepper(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 118,
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 46),
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: AppTheme.priceLabel,
                ),
                const SizedBox(height: 4),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: Text(
                    "\$${(product.price * quantity).toStringAsFixed(2)}",
                    key: ValueKey<double>(product.price * quantity),
                    style: AppTheme.priceValue,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                final cartItem = CartItem(
                  id: widget.product.title,
                  name: widget.product.title,
                  price: widget.product.price,
                  quantity: quantity,
                  imageUrl: widget.product.image,
                );

                CartManager().addItem(cartItem);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                minimumSize: const Size(217, 56),
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: Text(
                "Buy Now",
                style: AppTheme.buyButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
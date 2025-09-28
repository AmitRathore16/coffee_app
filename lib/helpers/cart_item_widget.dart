import 'package:coffee/api/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:coffee/models/cart_item.dart';
import 'package:coffee/theme/app_theme.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem item;
  final VoidCallback onUpdate;

  const CartItemWidget({super.key, required this.item, required this.onUpdate});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  void _increaseQuantity() {
    setState(() {
      widget.item.quantity++;
      CartManager().saveCart();
    });
    widget.onUpdate();
  }

  void _decreaseQuantity() {
    if (widget.item.quantity > 1) {
      setState(() {
        widget.item.quantity--;
        CartManager().saveCart();
      });
    } else {
      CartManager().removeItem(widget.item.id);
    }
    widget.onUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              widget.item.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  style: AppTheme.cardTitle,
                ),
                const SizedBox(height: 4),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: Text(
                    "\$${(widget.item.price * widget.item.quantity).toStringAsFixed(2)}",
                    style: AppTheme.priceText,
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 40,
            width: 124,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _decreaseQuantity,
                  child: Container(
                    width: 32,
                    height: 32,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppTheme.backgroundColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppTheme.cardBorder,
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.remove,
                      size: 16,
                      color: AppTheme.textColorSecondary,
                    ),
                  ),
                ),

                Text(
                  widget.item.quantity.toString(),
                  style: AppTheme.quantityText,
                ),

                GestureDetector(
                  onTap: _increaseQuantity,
                  child: Container(
                    width: 32,
                    height: 32,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppTheme.backgroundColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppTheme.cardBorder,
                        width: 1,
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 16,
                      color: AppTheme.textColorDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
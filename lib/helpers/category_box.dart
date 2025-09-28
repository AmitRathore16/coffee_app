import 'package:coffee/models/cart_item.dart';
import 'package:coffee/api/cart_service.dart';
import 'package:coffee/widgets/category_chips.dart';
import 'package:coffee/widgets/coffee_card.dart';
import 'package:flutter/material.dart';
import 'package:coffee/models/products.dart';
import 'package:coffee/theme/app_theme.dart';

class CategoryBox extends StatefulWidget {
  final String selectedCategory;
  final String searchQuery;
  final ValueChanged<String> onCategoryChanged;

  const CategoryBox({
    super.key,
    required this.selectedCategory,
    required this.searchQuery,
    required this.onCategoryChanged,
  });

  @override
  State<CategoryBox> createState() => _CategoryBoxState();
}

class _CategoryBoxState extends State<CategoryBox> {
  List<Product> _filterProducts() {
    List<Product> filteredByCategory = widget.selectedCategory == "All Coffee"
        ? demoProducts
        : demoProducts
        .where((p) => p.category == widget.selectedCategory)
        .toList();

    if (widget.searchQuery.isNotEmpty) {
      filteredByCategory = filteredByCategory.where((product) {
        final searchLower = widget.searchQuery.toLowerCase();
        return product.title.toLowerCase().contains(searchLower) ||
            product.subtitle.toLowerCase().contains(searchLower) ||
            product.category.toLowerCase().contains(searchLower);
      }).toList();
    }

    return filteredByCategory;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.872;
    final filteredProducts = _filterProducts();

    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: containerWidth,
        height: 450,
        margin: const EdgeInsets.only(left: 24, bottom: 0),
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            if (widget.searchQuery.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: CategoryChips(
                  selected: widget.selectedCategory,
                  onSelected: widget.onCategoryChanged,
                ),
              ),

            if (widget.searchQuery.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      'Search Results for "${widget.searchQuery}"',
                      style: AppTheme.searchText?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${filteredProducts.length} found',
                      style: AppTheme.searchHint?.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),

            Expanded(
              child: filteredProducts.isEmpty
                  ? _buildEmptyState()
                  : GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount: filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 156 / 238,
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.searchQuery.isNotEmpty ? Icons.search_off : Icons.coffee,
            size: 64,
            color: AppTheme.textColorSecondary,
          ),
          const SizedBox(height: 16),
          Text(
            widget.searchQuery.isNotEmpty
                ? 'No coffee found'
                : 'No coffee available',
            style: AppTheme.searchText?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.searchQuery.isNotEmpty
                ? 'Try searching with different keywords'
                : 'Check back later for new arrivals',
            style: AppTheme.searchHint?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
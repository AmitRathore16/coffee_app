import 'package:flutter/material.dart';
import 'package:coffee/theme/app_theme.dart';

class CategoryChips extends StatelessWidget {
  final String selected;
  final ValueChanged <String>onSelected;

  const CategoryChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      "All Coffee",
      "Machiato",
      "Latte",
      "Americano",
      "Espresso",
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category == selected;
          return GestureDetector(
            onTap: () => onSelected(category),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppTheme.selectedChipBackground
                    : AppTheme.chipBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                category,
                style: isSelected
                    ? AppTheme.categoryChipSelected
                    : AppTheme.categoryChipUnselected,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
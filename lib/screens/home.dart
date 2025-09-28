import 'package:coffee/helpers/category_box.dart';
import 'package:coffee/helpers/top_bar.dart';
import 'package:coffee/helpers/banner_card.dart';
import 'package:flutter/material.dart';
import 'package:coffee/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "All Coffee";
  String searchQuery = "";

  void _updateCategory(String value) {
    setState(() {
      selectedCategory = value;
      searchQuery = "";
    });
  }

  void _updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      if (query.isNotEmpty) {
        selectedCategory = "All Coffee";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBar(
                    onFilterSelected: _updateCategory,
                    onSearchChanged: _updateSearchQuery,
                    isDarkMode: widget.isDarkMode,
                    onThemeToggle: widget.onThemeToggle,
                  ),
                  const SizedBox(height: 80),
                  CategoryBox(
                    selectedCategory: selectedCategory,
                    searchQuery: searchQuery,
                    onCategoryChanged: _updateCategory,
                  ),
                ],
              ),
              if (searchQuery.isEmpty)
                const Positioned(
                  top: 220,
                  left: 24,
                  right: 24,
                  child: BannerCard(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:coffee/theme/app_theme.dart';

class TopBar extends StatefulWidget {
  final ValueChanged<String> onFilterSelected;
  final ValueChanged<String> onSearchChanged;
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const TopBar({
    super.key,
    required this.onFilterSelected,
    required this.onSearchChanged,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      widget.onSearchChanged(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      "All Coffee",
      "Machiato",
      "Latte",
      "Americano",
      "Espresso",
    ];

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppTheme.topBarGradient,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 68,
              left: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: AppTheme.locationLabel,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Bilzen, Tanjungbalai",
                        style: AppTheme.locationText,
                      ),
                      const SizedBox(width: 2),
                      IconButton(
                        onPressed: () {
                          debugPrint("Dropdown icon pressed");
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                          color: AppTheme.textColorLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 135,
              left: 24,
              child: Row(
                children: [
                  Container(
                    width: 259,
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppTheme.mediumBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _searchController,
                      style: AppTheme.searchText,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        hintText: "Search coffee",
                        hintStyle: AppTheme.searchHint,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Icon(
                            Icons.search,
                            size: 20,
                            color: AppTheme.textColorSecondary,
                          ),
                        ),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                          icon: Icon(
                            Icons.clear,
                            size: 20,
                            color: AppTheme.textColorSecondary,
                          ),
                          onPressed: () {
                            _searchController.clear();
                            FocusScope.of(context).unfocus();
                          },
                        )
                            : null,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: PopupMenuButton<String>(
                      onSelected: widget.onFilterSelected,
                      icon: const Icon(
                        Icons.filter_list,
                        size: 20,
                        color: Colors.white,
                      ),
                      itemBuilder: (context) {
                        return categories
                            .map(
                              (c) => PopupMenuItem<String>(
                            value: c,
                            child: Text(c),
                          ),
                        )
                            .toList();
                      },
                    ),
                  ),
                  const SizedBox(width: 16),

                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: widget.onThemeToggle,
                      icon: Icon(
                        widget.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        size: 20,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
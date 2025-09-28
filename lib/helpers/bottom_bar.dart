import 'package:coffee/screens/cart.dart';
import 'package:coffee/screens/favourite.dart';
import 'package:coffee/screens/home.dart';
import 'package:coffee/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static String routeName = '/home';
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const BottomBar({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<BottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  List<Widget> get _pages => [
    HomeScreen(
      isDarkMode: widget.isDarkMode,
      onThemeToggle: widget.onThemeToggle,
    ),
    const FavouriteScreen(),
    const Center(
      child: Text("Notifications Page", style: TextStyle(fontSize: 24)),
    ),
  ];

  void _onItemTapped(int index) {
    if (index == 3) {
      // Cart ko alag se open karo
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Cart()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 99,
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.bottomBarShadowColor,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                Icons.home_outlined,
                Icons.home,
                0,
                activeColor: AppTheme.primaryColor,
              ),
              _buildNavItem(Icons.favorite_border, Icons.favorite, 1),
              _buildNavItem(
                Icons.notifications_none_outlined,
                Icons.notifications,
                2,
              ),
              _buildNavItem(Icons.shopping_bag_outlined, Icons.shopping_bag, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon,
      IconData filledIcon,
      int index, {
        Color? activeColor,
      }) {
    final isSelected =
        _selectedIndex == index && index != 3;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? filledIcon : icon,
            size: 28,
            color: isSelected
                ? (activeColor ?? AppTheme.primaryColor)
                : AppTheme.inactiveIconColor,
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 6),
              width: 10,
              height: 5,
              decoration: BoxDecoration(
                color: activeColor ?? AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
        ],
      ),
    );
  }
}


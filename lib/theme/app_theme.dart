import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static bool _isDark = false;
  static void setDarkMode(bool isDark) {
    _isDark = isDark;
  }

  static bool get isDark => _isDark;

  // Primary Colors
  static const Color primaryColor = Color(0xFFC67C4E);
  static Color get backgroundColor =>
      _isDark ? const Color(0xFF121212) : Colors.white;
  static Color get scaffoldBackgroundColor =>
      _isDark ? const Color(0xFF121212) : const Color(0xFFF9F9F9);

  // Icon Colors
  static Color get inactiveIconColor =>
      _isDark ? const Color(0xFF757575) : const Color(0xFFA2A2A2);
  static Color get activeIconColor => const Color(0xFFC67C4E);

  // Text Colors
  static Color get textColorPrimary =>
      _isDark ? const Color(0xFFE0E0E0) : const Color(0xFF242424);
  static Color get textColorSecondary =>
      _isDark ? const Color(0xFFB0B0B0) : const Color(0xFFA2A2A2);
  static const Color textColorLight = Color(0xFFD8D8D8);
  static const Color textColorDark = Color(0xFF2A2A2A);
  static const Color textColorMedium = Color(0xFF313131);
  static Color get textColorTertiary =>
      _isDark ? const Color(0xFF888888) : const Color(0xFF7D7D7D);

  // Backgrounds
  static const Color darkBackground = Color(0xFF111111);
  static const Color mediumBackground = Color(0xFF2A2A2A);
  static Color get lightGrayBackground => const Color(0xFFEDEDED);
  static Color get chipBackground =>
      _isDark ? const Color(0xFF3A3A3A) : const Color(0xFFF5F5F5);
  static Color get borderColor =>
      _isDark ? const Color(0xFF404040) : const Color(0xFFE3E3E3);
  static Color get cardBorder =>
      _isDark ? const Color(0xFF3D3D3D) : const Color(0xFFF9F2ED);
  static const Color selectedChipBackground = Color(0xFFC67C4E);

  // Misc Colors
  static const Color ratingColor = Color(0xFFFBBE21);
  static const Color progressActiveColor = Colors.green;
  static const Color deliveryIconBackground = Color(0xFFF9F2ED);
  static const Color darkDeliveryIconBackground = Color(0xFF3A3A3A);

  static Color get bottomBarShadowColor =>
      _isDark ? Colors.black26 : Colors.black12;
  static Color get cardShadowColor =>
      _isDark ? Colors.black38 : Colors.black12;
  static const Color darkBottomBarShadowColor = Colors.black26;
  static const Color darkCardShadowColor = Colors.black38;

  // Text Styles
  static TextStyle get headline => GoogleFonts.sora(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: textColorPrimary,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static TextStyle get appBarTitle => GoogleFonts.sora(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: textColorPrimary,
  );

  static TextStyle get productTitle => GoogleFonts.sora(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: textColorPrimary,
  );

  static TextStyle get cardTitle => GoogleFonts.sora(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: textColorPrimary,
  );

  static TextStyle get coffeeCardTitle => TextStyle(
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: textColorPrimary,
  );

  static TextStyle get coffeeCardSubtitle => TextStyle(
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: textColorSecondary,
  );

  static TextStyle get coffeeCardPrice => TextStyle(
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: _isDark ? Colors.white : Colors.black,
  );

  static const TextStyle categoryChipSelected = TextStyle(
    fontFamily: "Sora",
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle get categoryChipUnselected => TextStyle(
    fontFamily: "Sora",
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: _isDark ? Colors.white : Colors.black,
  );

  static TextStyle get body => GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textColorSecondary,
    height: 1.5,
    letterSpacing: 1,
  );

  static TextStyle get bodyPrimary => GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textColorPrimary,
  );

  static TextStyle get bodyMedium => GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textColorPrimary,
  );

  static TextStyle get productSubtitle => GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.2,
    color: textColorSecondary,
  );

  static TextStyle get ratingText => GoogleFonts.sora(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.0,
    color: textColorPrimary,
  );

  static TextStyle get ratingCount => GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.0,
    color: textColorSecondary,
  );

  static const TextStyle ratingCardText = TextStyle(
    fontFamily: 'Sora',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle get descriptionText => GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.5,
    color: textColorPrimary,
  );

  static const TextStyle sizeButtonSelected = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: primaryColor,
  );

  static TextStyle get sizeButtonUnselected => GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: textColorPrimary,
  );

  static TextStyle get priceLabel => GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.2,
    color: textColorSecondary,
  );

  static TextStyle get priceValue => GoogleFonts.sora(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: textColorPrimary,
  );

  static TextStyle get orderTimeLeft => GoogleFonts.sora(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: textColorPrimary,
  );

  static TextStyle get deliveryAddress => GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: textColorPrimary,
  );

  static const TextStyle deliveryAddressBold = TextStyle(
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get courierName => GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: textColorPrimary,
  );

  static TextStyle get courierRole => GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.2,
    color: textColorTertiary,
  );

  static TextStyle get deliveryCardTitle => GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: textColorPrimary,
  );

  static TextStyle get deliveryCardDescription => GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    height: 1.5,
    color: textColorTertiary,
  );

  static TextStyle get locationLabel => TextStyle(
    fontFamily: "Sora",
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: textColorSecondary,
    height: 1.2,
    letterSpacing: 0.5,
  );

  static const TextStyle locationText = TextStyle(
    fontFamily: "Sora",
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: textColorLight,
    height: 1.5,
  );

  static TextStyle get searchHint => TextStyle(
    fontFamily: "Sora",
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: textColorSecondary,
    height: 1.2,
  );

  static const TextStyle searchText = TextStyle(
    fontFamily: "Sora",
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: textColorLight,
    height: 1.2,
  );

  static TextStyle get priceText => GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.2,
    color: textColorSecondary,
  );

  static const TextStyle quantityText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textColorDark,
    height: 1.5,
  );

  static TextStyle get quantityLabelText => GoogleFonts.sora(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: textColorPrimary,
  );

  static TextStyle get quantityValueText => GoogleFonts.sora(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textColorPrimary,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.5,
  );

  static const TextStyle buyButtonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: Colors.white,
  );

  static const TextStyle smallText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColorDark,
    height: 1.2,
  );

  static TextStyle get addressText => GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.2,
    color: textColorSecondary,
  );

  // Gradients
  static LinearGradient get topBarGradient => _isDark
      ? const LinearGradient(
    begin: Alignment(-0.77, -0.64),
    end: Alignment(0.77, 0.64),
    colors: [Color(0xFF0A0A0A), Color(0xFF1A1A1A)],
  )
      : const LinearGradient(
    begin: Alignment(-0.77, -0.64),
    end: Alignment(0.77, 0.64),
    colors: [Color(0xFF111111), Color(0xFF313131)],
  );

  static const LinearGradient darkTopBarGradient = LinearGradient(
    begin: Alignment(-0.77, -0.64),
    end: Alignment(0.77, 0.64),
    colors: [Color(0xFF0A0A0A), Color(0xFF1A1A1A)],
  );

  // ThemeData
  static ThemeData get lightTheme {
    setDarkMode(false);
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      cardColor: backgroundColor,
      dividerColor: borderColor,
      textTheme: TextTheme(
        headlineLarge: headline,
        bodyMedium: body,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      iconTheme: IconThemeData(color: inactiveIconColor),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: textColorPrimary,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: backgroundColor,
        selectedItemColor: activeIconColor,
        unselectedItemColor: inactiveIconColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    setDarkMode(true);
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      cardColor: backgroundColor,
      dividerColor: borderColor,
      textTheme: TextTheme(
        headlineLarge: headline,
        bodyMedium: body,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      iconTheme: IconThemeData(color: inactiveIconColor),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: textColorPrimary,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: backgroundColor,
        selectedItemColor: activeIconColor,
        unselectedItemColor: inactiveIconColor,
      ),
    );
  }
}
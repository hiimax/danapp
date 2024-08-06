// ignore_for_file: deprecated_member_use

import '../import/import.dart';

class ThemeHelper {
  static ThemeData lightTheme = ThemeData(
    fontFamily: StringConstants.danappFontFamily,
    extensions: [
      danappDesignSystem(
        danappGrey: danappGrey,
        danappBackgroundColor: danappBackgroundColor,
        danappTextColor: danappTextColor,
        containerBg: Colors.white,
      )
    ],
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: danappBackgroundColor,
    backgroundColor: danappBackgroundColor,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    // accentColor: Colors.orange,
    canvasColor: Colors.white,
    cardColor: Colors.white,
    dividerColor: Colors.grey,
    focusColor: Colors.blue,
    hoverColor: Colors.grey[200],
    errorColor: Colors.red,
    bottomAppBarTheme: const BottomAppBarTheme(
      surfaceTintColor: Colors.white,
    ),
    tabBarTheme: TabBarTheme(
      indicator: const BoxDecoration(
          // color: danappGrey.withOpacity(0.5),
          // borderRadius: BorderRadius.circular(8),
          // boxShadow: const [
          //   BoxShadow(
          //     color: danappGrey,
          //     blurRadius: 2,
          //   ),
          // ],
          ),
      labelPadding: const EdgeInsets.symmetric(vertical: 8),
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      labelColor: danappBlack,
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontStyle: FontStyle.normal,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: danappWhite,
      surfaceTintColor: Colors.white,
      // brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontSize: 16.0, color: danappTextColor, fontWeight: FontWeight.w500),
      headline3: TextStyle(
          fontSize: 16.0, color: danappGrey, fontWeight: FontWeight.w500),
      bodyText1: TextStyle(
          fontSize: 12.0, color: danappTextColor, fontWeight: FontWeight.w500),
      bodyText2: TextStyle(
        fontSize: 14.0,
        color: danappTextColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: TextStyle(
        fontSize: 10.0,
        color: danappTextColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: TextStyle(
        fontSize: 10.0,
        color: danappGrey,
        fontWeight: FontWeight.w500,
      ),
      headline4: TextStyle(
        fontSize: 10.0,
        color: danappGrey,
        fontWeight: FontWeight.w500,
      ),
      headline5: TextStyle(
        fontSize: 12.0,
        color: danappGrey,
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        fontSize: 12.0,
        color: danappTextColor,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: TextStyle(
        fontSize: 12.0,
        color: danappGrey,
        fontWeight: FontWeight.w500,
      ),
      button: TextStyle(fontSize: 16.0, color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      color: danappBlack,
      size: 24.0,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    extensions: [
      danappDesignSystem(
        danappGrey: danappGrey,
        danappBackgroundColor: danappBackgroundColor,
        danappTextColor: danappTextColor,
        containerBg: danappBackgroundColor,
      )
    ],
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: danappBackgroundColor,
    backgroundColor: danappBackgroundColor,
    brightness: Brightness.dark,
    tabBarTheme: const TabBarTheme(
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: danappBackgroundColor,
    ),
    primaryColor: Colors.blue,
    // accentColor: Colors.orange,
    canvasColor: Colors.black,
    cardColor: Colors.black,
    dividerColor: Colors.grey,
    focusColor: Colors.blue,
    hoverColor: Colors.grey[200],
    errorColor: Colors.red,
    appBarTheme: const AppBarTheme(
      color: danappBackgroundColor,
      // brightness: Brightness.dark,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontSize: 16.0, color: danappTextColor, fontWeight: FontWeight.w500),
      headline3: TextStyle(
          fontSize: 16.0, color: danappTextColor, fontWeight: FontWeight.w500),
      bodyText1: TextStyle(
        fontSize: 12.0,
        color: danappTextColor,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
        color: danappTextColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: TextStyle(
        fontSize: 10.0,
        color: danappTextColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: TextStyle(
        fontSize: 10.0,
        color: danappTextColor,
        fontWeight: FontWeight.w500,
      ),
      headline4: TextStyle(
        fontSize: 10.0,
        color: danappTextColor,
        fontWeight: FontWeight.w500,
      ),
      headline5: TextStyle(
        fontSize: 12.0,
        color: danappTextColor,
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        fontSize: 12.0,
        color: danappTextColor,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: TextStyle(
        fontSize: 12.0,
        color: danappTextColor,
        fontWeight: FontWeight.w500,
      ),
      button: TextStyle(fontSize: 16.0, color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      color: danappWhite,
      size: 24.0,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
    ),
  );
}

class danappDesignSystem extends ThemeExtension<danappDesignSystem> {
  Color? cardStrokeColor;
  Color? danappGrey;
  Color? danappBackgroundColor;
  Color? danappTextColor;
  Color? danappSellColor;
  Color? danappFountainblueColor;
  Color? containerBg;

  danappDesignSystem({
    this.cardStrokeColor,
    this.danappGrey,
    this.danappBackgroundColor,
    this.danappTextColor,
    this.danappSellColor,
    this.danappFountainblueColor,
    this.containerBg,
  });

  @override
  ThemeExtension<danappDesignSystem> copyWith({
    Color? cardStrokeColor,
    Color? danappGrey,
    Color? danappBackgroundColor,
    Color? danappTextColor,
    Color? danappSellColor,
    Color? danappFountainblueColor,
    Color? containerBg,
  }) {
    return danappDesignSystem()
      ..cardStrokeColor = cardStrokeColor ?? this.cardStrokeColor
      ..danappGrey = danappGrey ?? this.danappGrey
      ..danappBackgroundColor =
          danappBackgroundColor ?? this.danappBackgroundColor
      ..danappTextColor = danappTextColor ?? this.danappTextColor
      ..danappTextColor = danappTextColor ?? this.danappTextColor
      ..danappGrey = danappGrey ?? this.danappGrey
      ..danappSellColor = danappSellColor ?? this.danappSellColor
      ..danappGrey = danappGrey ?? this.danappGrey
      ..danappFountainblueColor =
          danappFountainblueColor ?? this.danappFountainblueColor
      ..containerBg = containerBg ?? this.containerBg;
  }

  @override
  ThemeExtension<danappDesignSystem> lerp(
      covariant ThemeExtension<danappDesignSystem>? other, double t) {
    if (other == null) {
      return this;
    }
    final danappDesignSystem otherDesignSystem = other as danappDesignSystem;
    return danappDesignSystem(
      cardStrokeColor:
          Color.lerp(cardStrokeColor, otherDesignSystem.cardStrokeColor, t),
      danappGrey: Color.lerp(danappGrey, otherDesignSystem.danappGrey, t),
      danappBackgroundColor: Color.lerp(
          danappBackgroundColor, otherDesignSystem.danappBackgroundColor, t),
      danappTextColor:
          Color.lerp(danappTextColor, otherDesignSystem.danappTextColor, t),
      danappSellColor:
          Color.lerp(danappSellColor, otherDesignSystem.danappSellColor, t),
      danappFountainblueColor: Color.lerp(danappFountainblueColor,
          otherDesignSystem.danappFountainblueColor, t),
      containerBg: Color.lerp(containerBg, otherDesignSystem.containerBg, t),
    );
  }
}

extension ThemeDataExtension on BuildContext {
  danappDesignSystem? get designSystem =>
      Theme.of(this).extension<danappDesignSystem>();
}

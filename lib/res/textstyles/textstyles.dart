import 'package:danapp/res/import/import.dart';

class DanappTextStyle {
  static TextStyle size30 = TextStyle(
      fontSize: (30).sp,
      color: danappTextColor,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.danappFontFamily);

  static TextStyle size24 = TextStyle(
      fontSize: (24).sp,
      color: danappTextColor,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.danappFontFamily);
  static TextStyle size20 = TextStyle(
      fontSize: (20).sp,
      color: danappTextColor,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.danappFontFamily);
  static TextStyle size18 = TextStyle(
      fontSize: (18).sp,
      color: danappTextColor,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.danappFontFamily);
  static TextStyle size16 = TextStyle(
      fontSize: (16).sp,
      color: danappTextColor,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.danappFontFamily);
  static TextStyle size14 = TextStyle(
      fontSize: (14).sp,
      color: danappTextColor,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.danappFontFamily);
  static TextStyle size12 = TextStyle(
      fontSize: (12.sp),
      // color: CbColors.cAccentLighten3,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.danappFontFamily);
  static TextStyle size10 = TextStyle(
      fontSize: (10.sp),
      // color: CbColors.cAccentLighten3,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.danappFontFamily);
  static TextStyle errorSubText = TextStyle(
      color: kDebugMode ? Colors.red : Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 21.sp);
}

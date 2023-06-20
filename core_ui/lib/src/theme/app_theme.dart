part of core_ui;

const LightColors _appColors = LightColors();

final ThemeData lightTheme = ThemeData.light().copyWith(
  // appBarTheme: _getAppBarTheme(),
  scaffoldBackgroundColor: _appColors.white,
  textTheme: _getTextTheme(),
  inputDecorationTheme: _getInputDecorationTheme(),
  primaryColor: _appColors.red,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: _appColors.red,
    primary: _appColors.black,
  ),
);
//
// AppBarTheme _getAppBarTheme() {
//   return AppBarTheme(
//     backgroundColor: _appColors.primary,
//     titleTextStyle: AppFonts.sfproNormal16.copyWith(
//       color: _appColors.mainText,
//     ),
//   );
// }
//
TextTheme _getTextTheme() {
  return TextTheme(
    titleMedium: AppFonts.normal18,
    bodyMedium: AppFonts.normal18,
  ).apply(
    bodyColor: _appColors.textDark,
    displayColor: _appColors.textDark,
  );
}

InputDecorationTheme _getInputDecorationTheme() {
  return InputDecorationTheme(
    hintStyle: AppFonts.normal13.copyWith(color: _appColors.textGrey),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_12),
      ),
      borderSide: BorderSide(
        color: _appColors.inputBorderColorUnActive,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_12),
      ),
      borderSide: BorderSide(
        color: _appColors.darkGray,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_6),
      ),
      borderSide: BorderSide(
        color: _appColors.red,
        width: 2,
      ),
    ),
    labelStyle: AppFonts.normal13.copyWith(color: _appColors.textGrey),
  );
}

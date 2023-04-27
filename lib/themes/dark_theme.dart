part of 'themes.dart';

class _DarkTheme {
  static ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      },
    ),
    textTheme: GoogleFonts.montserratTextTheme(),

    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.appColor,
      secondary: AppColors.appColor,
    ),
    primaryTextTheme: GoogleFonts.montserratTextTheme(),
    toggleableActiveColor: AppColors.appColor,

    // appBarTheme: AppBarTheme(color: AppColors.white),
    // scaffoldBackgroundColor: AppColors.scaffoldColor,
    // focusColor: AppColors.greyColor.withOpacity(0.12),
    // hoverColor: AppColors.inputDefault,
    // disabledColor: AppColors.inputDisable,
    // primaryColorLight: AppColors.inputDefault,
    // platform: TargetPlatform.iOS,
    // toggleButtonsTheme: ToggleButtonsThemeData(
    //   textStyle: AppText.text14w400,
    // ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.appColor),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.appColor;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.appColor;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.appColor;
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.appColor;
        }
        return null;
      }),
    ),
  );
}

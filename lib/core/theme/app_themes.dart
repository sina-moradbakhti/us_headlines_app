import 'package:flutter/material.dart';
import 'package:nexttoptech_assignment/core/theme/app_colors.dart';

class DefaultAppTheme {
  static double defaultRadius = 8.0;
  static EdgeInsets defaultBodyPadding = const EdgeInsets.all(16.0);
  static EdgeInsets secondBodyPadding = const EdgeInsets.all(24.0);
  static EdgeInsets defaultTextfieldPadding =
      const EdgeInsets.symmetric(vertical: 12.5, horizontal: 16.0);

  static final TextStyle baseTextStyle = TextStyle(
    fontFamily: 'Tahoma',
    color: AppColors.darkTextColor,
  );

  static ThemeData get theme => ThemeData(
        fontFamily: 'Tahoma',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        primaryColor: AppColors.primaryColor,
        brightness: Brightness.light,
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
            modalBackgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            modalBarrierColor: Colors.transparent,
            dragHandleColor: Colors.transparent,
            surfaceTintColor: Colors.transparent),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.scaffoldBgColor,
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textfieldBgColor),
            ),
            isDense: true,
            filled: true,
            fillColor: AppColors.textfieldBgColor,
            contentPadding: defaultTextfieldPadding,
            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.textfieldHintColor,
            )),
        textTheme: TextTheme(
          titleSmall: baseTextStyle.copyWith(
            fontSize: 12,
          ),
          titleMedium: baseTextStyle.copyWith(
            fontSize: 14,
          ),
          headlineSmall: baseTextStyle.copyWith(
            fontSize: 15,
          ),
          headlineMedium: baseTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: baseTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: baseTextStyle.copyWith(
            fontSize: 12.5,
          ),
          bodyLarge: baseTextStyle.copyWith(
            fontSize: 13.5,
          ),
          bodySmall: baseTextStyle.copyWith(
            fontSize: 11.5,
          ),
          labelSmall: baseTextStyle.copyWith(
            fontSize: 10.5,
          ),
        ),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(
            background: AppColors.primaryColor,
            secondary: AppColors.primaryButtonTextColor,
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
            textStyle: baseTextStyle.copyWith(
              fontSize: 18,
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: baseTextStyle.copyWith(
                fontSize: 18,
              ),
            )),
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: baseTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}

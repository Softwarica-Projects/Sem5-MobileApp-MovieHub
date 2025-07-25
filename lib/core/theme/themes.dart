import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviehub/core/constant/app_defaults.dart';
import 'package:moviehub/core/theme/app_colors.dart';

class Themes {
  //Default Icon Size

  ThemeData theme() {
    return ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.kColorBackground,
          selectedIconTheme: IconThemeData(
            size: 24.sp,
            color: AppColors.primary,
          ),
          unselectedIconTheme: IconThemeData(
            size: 24.sp,
            color: Color(0xff92929D),
          ),
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.kColorBackground,
        drawerTheme: DrawerThemeData(backgroundColor: Colors.white, surfaceTintColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        hintColor: AppColors.kHintColorText,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.sp),
          ),
        ),
        useMaterial3: true,
        dividerTheme: const DividerThemeData(
          color: AppColors.kColorDivier,
          thickness: 0.5,
        ),
        dialogBackgroundColor: AppColors.kColorBackground,
        dialogTheme: const DialogTheme(
          backgroundColor: AppColors.kColorBackground,
        ),
        listTileTheme: ListTileThemeData(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.sp)),
          selectedColor: Colors.white,
          titleTextStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
          textColor: Colors.black,
          contentPadding: const EdgeInsets.all(0),
          minLeadingWidth: 0,
        ),
        fontFamily: AppDefaults.fontFamily,
        appBarTheme: appBarTheme,
        cardColor: AppColors.cardBackgroundColor,
        cardTheme: CardTheme(color: AppColors.cardBackgroundColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.sp))),
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontSize: 14.sp,
            fontFamily: AppDefaults.fontFamily,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: AppDefaults.fontFamily,
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primary,
            fontFamily: AppDefaults.fontFamily,
          ),
          headlineMedium: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: AppDefaults.fontFamily,
          ),
          headlineLarge: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: AppDefaults.fontFamily,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ), //defaul text style
        ),
        radioTheme: const RadioThemeData(),
        tabBarTheme: TabBarTheme(
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: AppColors.primary,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: AppDefaults.fontFamily,
            color: Colors.white,
            fontSize: 14.sp,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: AppDefaults.fontFamily,
            color: Colors.white,
            fontSize: 14.sp,
          ),
          labelColor: Colors.white,
          labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
          unselectedLabelColor: Colors.white,
        ),
        chipTheme: ChipThemeData(
          side: BorderSide.none,
          deleteIconColor: Colors.white,
          backgroundColor: AppColors.primary,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          labelPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0),
          labelStyle: TextStyle(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        checkboxTheme: CheckboxThemeData(
          side: const BorderSide(color: AppColors.kCheckBoxBorder),
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return Colors.white;
          }),
          checkColor: WidgetStateProperty.resolveWith((states) => Colors.white),
          overlayColor: WidgetStateProperty.resolveWith((states) => AppColors.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.sp)),
        ),
        primarySwatch: AppColors.primaryMaterialColor,
        dividerColor: AppColors.kColorDivier,
        textButtonTheme: textButtonTheme(),
        outlinedButtonTheme: outlinedButtonTheme(),
        elevatedButtonTheme: elevatedButtonTheme(),
        iconTheme: IconThemeData(size: 24.sp, color: Colors.black),
        inputDecorationTheme: inputDecorationTheme);
  }

  static boderStyle({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: BorderSide(
          color: color ?? AppColors.primary,
        ),
      );
  OutlinedButtonThemeData outlinedButtonTheme() => OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) => AppColors.primary),
          side: WidgetStateProperty.resolveWith((states) => const BorderSide(color: AppColors.primary)),
          iconColor: WidgetStateProperty.resolveWith((states) => AppColors.primary),
          textStyle: WidgetStateProperty.resolveWith((states) => TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              )),
          shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDefaults.borderRadius),
              )),
          minimumSize: WidgetStateProperty.resolveWith<Size>(
            (states) => Size(
              AppDefaults.deviceType == DeviceType.mobile ? double.maxFinite : 200.w,
              AppDefaults.buttonHeight,
            ),
          ),
        ),
      );
  TextButtonThemeData textButtonTheme() => TextButtonThemeData(
        style: ButtonStyle(
          iconSize: WidgetStateProperty.resolveWith((states) => 18.sp),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) => Colors.white),
          textStyle: WidgetStateProperty.resolveWith((states) => TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              )),
          shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDefaults.borderRadius),
              )),
          iconColor: WidgetStateProperty.resolveWith((states) => Colors.white),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) => AppColors.primary),
          minimumSize: WidgetStateProperty.resolveWith<Size>(
            (states) => Size(
              AppDefaults.deviceType == DeviceType.mobile ? double.maxFinite : 180.w,
              AppDefaults.buttonHeight,
            ),
          ),
        ),
      );
  ElevatedButtonThemeData elevatedButtonTheme() => ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) => Colors.white),
          textStyle: WidgetStateProperty.resolveWith((states) => TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white)),
          shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDefaults.borderRadius),
              )),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) => AppColors.primary),
          minimumSize: WidgetStateProperty.resolveWith<Size>(
            (states) => Size(AppDefaults.deviceType == DeviceType.mobile ? double.maxFinite : 200.w, AppDefaults.buttonHeight),
          ),
        ),
      );
  final AppBarTheme appBarTheme = AppBarTheme(
    elevation: 0.0,
    toolbarHeight: AppDefaults.appBarheight,
    foregroundColor: Colors.white,
    scrolledUnderElevation: 0,
    centerTitle: true,
    titleSpacing: 0,
    backgroundColor: AppColors.kColorBackground,
    actionsIconTheme: IconThemeData(size: 22.sp, color: Colors.white),
    iconTheme: IconThemeData(size: 22.sp, color: Colors.white),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.sp,
      fontFamily: AppDefaults.fontFamily,
    ),
  );

  final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: false,
    errorMaxLines: 2,
    suffixIconConstraints: BoxConstraints(
      minHeight: 28.sp,
      minWidth: 28.sp,
    ),
    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13.sp),
    hintStyle: TextStyle(color: AppColors.kHintColorText, fontWeight: FontWeight.w500, fontSize: 14.sp),
    contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
    iconColor: AppColors.kInputDecorationIconColor,
    errorStyle: TextStyle(
      color: AppColors.kColorError,
      fontWeight: FontWeight.w500,
      fontSize: 13.sp,
    ),
    border: boderStyle(color: AppColors.kBorderColor),
    focusedBorder: boderStyle(color: AppColors.primary),
    errorBorder: boderStyle(
      color: AppColors.kColorError,
    ),
    focusedErrorBorder: boderStyle(
      color: AppColors.primary,
    ),
    disabledBorder: boderStyle(color: AppColors.kBorderColor),
    enabledBorder: boderStyle(color: AppColors.kBorderColor),
  );
}

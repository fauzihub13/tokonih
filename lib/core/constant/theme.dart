import 'package:flutter/material.dart';

class FontSize {
  static const h1 = 31.0;
  static const h2 = 25.0;
  static const h3 = 20.0;
  static const body = 16.0;
  static const caption = 13.0;
}

class PaddingSize {
  static const horizontal = 18.0;
  static const vertical = 18.0;
}

class DefaultColors {
  // =========== GREEN ===========
  static const green500 = Color(0xff18cf6d);
  static const green600 = Color(0xff0dac57);
  static const green700 = Color(0xff0e8345);

  // =========== RED ===========
  static const red400 = Color(0xffff6979);
  static const red500 = Color(0xfffe354e);
  static const red600 = Color(0xffde1135);

  // =========== BLUE ===========
  static const blue50 = Color(0xffebefff);
  static const blue100 = Color(0xffdae2ff);
  static const blue200 = Color(0xffbcc8ff);
  static const blue300 = Color(0xff94a3ff);
  static const blue400 = Color(0xff6a70ff);
  static const blue500 = Color(0xff4f48ff);
  static const blue600 = Color(0xff4027ff);
  static const blue700 = Color(0xff452ce8);
  static const blue800 = Color(0xff2c1ab9);
  static const blue900 = Color(0xff291e91);
  static const blue950 = Color(0xff1a1254);

  // =========== NEUTRAL ===========
  static const neutral50 = Color(0xffFBFBFC);
  static const neutral100 = Color(0xffeeeef1);
  static const neutral200 = Color(0xffe0e0e5);
  static const neutral300 = Color(0xffcecdd4);
  static const neutral400 = Color(0xffc2c1c9);
  static const neutral500 = Color(0xffa7a5af);
  static const neutral600 = Color(0xff938f9c);
  static const neutral700 = Color(0xff7f7b87);
  static const neutral800 = Color(0xff68656e);
  static const neutral900 = Color(0xff57545b);
  static const neutral950 = Color(0xff323135);

  // =========== DASHBOARD ===========
  static const totalSales = Color(0xffF1F6FF);
  static const totalProfit = Color(0xffF2FFEB);
  static const totalTransaction = Color(0xffF2FDFF);
  static const totalDiscount = Color(0xffFFF9F1);
  static const totalProduct = Color(0xffF8F8F8);
  static const totalProductCategory = Color(0xffF8F6FF);

  // =========== SNACKBAR ===========
  static const Color snackBarblue = Color(0xff50C474);
  static const Color snackBarYellow = Color(0xffFEC62E);
  static const Color snackBarRed = Color(0xffF4261A);

  // =========== APPBAR ===========
  static const Color appBarBackgroundColor = Color(0xffFFFFFF);

  // =========== BADGE ===========
  static const Color lightYellowBadge = Color(0xffFFF5D9);
  static const Color darkYellowBadge = Color(0xffCC9603);
  static const Color lightblueBadge = Color.fromARGB(255, 210, 247, 211);
  static const Color darkblueBadge = Color(0xff387F39);
  static const Color lightRedBadge = Color.fromARGB(255, 255, 156, 150);
  static const Color darkRedBadge = Color.fromARGB(255, 255, 28, 16);
  static const Color darkBlueBadge = Color(0xFF0165FC);
  static const Color lightBlueBadge = Color(0xffE0EBFF);
}

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: FontSize.h1,
          color: DefaultColors.neutral950,
        ),
        titleMedium: TextStyle(
          fontSize: FontSize.h2,
          color: DefaultColors.neutral950,
        ),
        bodyLarge: TextStyle(
          fontSize: FontSize.h3,
          color: DefaultColors.neutral950,
        ),
        bodyMedium: TextStyle(
          fontSize: FontSize.body,
          color: DefaultColors.neutral950,
        ),
        bodySmall: TextStyle(
          fontSize: FontSize.caption,
          color: DefaultColors.neutral950,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: DefaultColors.blue600,
        selectionColor: DefaultColors.blue100,
        selectionHandleColor: DefaultColors.blue600,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: DefaultColors.neutral900),
        hintStyle: TextStyle(
          fontSize: FontSize.body,
          color: DefaultColors.neutral900,
        ),
        iconColor: DefaultColors.neutral400,
        suffixIconColor: DefaultColors.neutral400,
        prefixIconColor: DefaultColors.neutral400,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: DefaultColors.neutral400, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: DefaultColors.neutral400, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: DefaultColors.neutral900, width: 1.5),
        ),
      ),
      iconTheme: IconThemeData(color: DefaultColors.neutral100),
      buttonTheme: ButtonThemeData(buttonColor: DefaultColors.blue600),
      dialogTheme: DialogThemeData(backgroundColor: Colors.white),
      tabBarTheme: TabBarThemeData(
        splashFactory: InkRipple.splashFactory,
        overlayColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          return states.contains(WidgetState.focused)
              ? null
              : DefaultColors.blue200;
        }),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size(0, 0),
        ),
      ),
    );
  }
}

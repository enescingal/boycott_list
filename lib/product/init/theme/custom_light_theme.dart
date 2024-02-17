import 'package:boycott_list/product/init/theme/custom_text_scheme.dart';
import 'package:boycott_list/product/init/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme: CustomColorScheme.lightColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        scaffoldBackgroundColor: ColorName.white,
        textTheme: CustomTextScheme.customTextTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorName.green,
          iconTheme: IconThemeData(color: ColorName.white),
          titleTextStyle: TextStyle(
            color: ColorName.white,
          ),
          elevation: 0,
        ),
        listTileTheme: const ListTileThemeData(
          dense: true,
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
        ),
        dialogTheme: const DialogTheme(
          backgroundColor: ColorName.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData => const FloatingActionButtonThemeData();
}

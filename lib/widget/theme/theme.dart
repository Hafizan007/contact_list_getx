import 'package:contact_list/widget/theme/schema.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData themeData(BuildContext context) {
    return ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: kPrimaryColor,
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: kWhiteBackground,
            iconTheme: IconThemeData(color: kBlack),
            actionsIconTheme: IconThemeData(color: kPrimaryColor),
            centerTitle: false,
            elevation: 0.3,
            titleTextStyle: TextStyle(
                color: kBlack, fontSize: 18, fontWeight: FontWeight.w500)),
        textTheme: GoogleFonts.lexendDecaTextTheme(
          Theme.of(context).textTheme,
        ),
        backgroundColor: kBackgroundColor,
        scaffoldBackgroundColor: kBackgroundColor);
  }
}

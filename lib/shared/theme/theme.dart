import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

// Text Style
TextStyle headlineStyle = GoogleFonts.poppins().copyWith(
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: blackColor,
);
TextStyle titleStyle = GoogleFonts.poppins().copyWith(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: blackColor,
);
TextStyle subtitleStyle = GoogleFonts.poppins().copyWith(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: blackColor,
);
TextStyle bodyRegularStyle = GoogleFonts.poppins().copyWith(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: blackColor,
);
TextStyle bodyMediumStyle = GoogleFonts.poppins().copyWith(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: blackColor,
);
TextStyle captionStyle = GoogleFonts.poppins().copyWith(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: blackColor,
);

// Color
Color mainColor = Color(0xFF00B412);
Color secondaryColor = Color(0xFFA2E8DE);
Color yellowColor = Color(0xFFFBC52D);
Color redColor = Color(0xFFDA2C38);
Color blackColor = Color(0xFF2F2C2C);
Color whiteColor = Color(0xFFFEFEFE);
Color greyColor = Color(0xFF8D92A3);

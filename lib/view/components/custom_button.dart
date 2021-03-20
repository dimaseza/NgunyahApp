import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;

  CustomButton({
    @required this.text,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 20,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
        ),
        onPressed: () {},
      ),
    );
  }
}

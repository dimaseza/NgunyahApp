import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';
import 'package:tubes_apb_nih/view/pages/pages.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 210,
              width: 200,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/order.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "You've Made Order",
              style: titleStyle,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Just stay at home while we are\npreparing your best foods",
              style: bodyRegularStyle.copyWith(
                color: greyColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 44,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(
                      MainPage(
                        bottomNavBarIndex: 0,
                      ),
                    );
                  },
                  child: Text("Order Other Foods"),
                  style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    textStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextButton(
              onPressed: () {},
              child: Text("View My Order"),
              style: TextButton.styleFrom(
                primary: mainColor,
                textStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

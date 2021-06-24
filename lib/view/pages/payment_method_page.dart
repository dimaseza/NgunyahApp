import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';
import 'package:tubes_apb_nih/view/pages/pages.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentMethodPage extends StatelessWidget {
  final String paymentUrl;

  PaymentMethodPage(this.paymentUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Payment.png'),
                ),
              ),
            ),
            Text(
              "Finish Your Payment",
              style: titleStyle,
            ),
            Text(
              "Please select your favourite\npayment method",
              style: subtitleStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: greyColor,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 30,
                bottom: 12,
              ),
              width: 200,
              height: 45,
              child: ElevatedButton(
                onPressed: () async {
                  await launch(paymentUrl);
                },
                style: ElevatedButton.styleFrom(
                  primary: mainColor,
                  textStyle: subtitleStyle.copyWith(
                    color: whiteColor,
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Payment Method"),
              ),
            ),
            Container(
              width: 200,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(SuccessPage());
                },
                style: ElevatedButton.styleFrom(
                  primary: whiteColor,
                  textStyle: subtitleStyle.copyWith(
                    color: mainColor,
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      width: 1,
                      color: mainColor,
                    ),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: subtitleStyle.copyWith(
                    color: mainColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

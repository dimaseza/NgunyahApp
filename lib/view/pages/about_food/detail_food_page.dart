import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tubes_apb_nih/data/models/models.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';
import 'package:tubes_apb_nih/view/components/components.dart';
import 'package:tubes_apb_nih/view/pages/pages.dart';

class DetailFoodPage extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;

  DetailFoodPage({
    this.onBackButtonPressed,
    this.transaction,
  });

  @override
  _DetailFoodPageState createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              color: whiteColor,
            ),
          ),
          SafeArea(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    blackColor.withOpacity(0.2),
                    blackColor.withOpacity(0.6),
                  ],
                ),
                image: DecorationImage(
                  image: NetworkImage(widget.transaction.food.picturePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    blackColor.withOpacity(0.2),
                    blackColor.withOpacity(0.6),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                if (widget.onBackButtonPressed != null) {
                                  widget.onBackButtonPressed();
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(3),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.black12,
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: whiteColor,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 180),
                      padding: EdgeInsets.symmetric(
                        vertical: 26,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: whiteColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.transaction.food.name,
                                      style: titleStyle,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    RatingStars(widget.transaction.food.rate),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = max(1, quantity - 1);
                                      });
                                    },
                                    child: Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(width: 2),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    child: Text(
                                      quantity.toString(),
                                      textAlign: TextAlign.center,
                                      style: titleStyle,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = min(999, quantity + 1);
                                      });
                                    },
                                    child: Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(width: 2),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(16, 0, 16, 8),
                            child: Text(
                              "Description",
                              style: titleStyle,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Text(
                              widget.transaction.food.description,
                              style: bodyRegularStyle,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(16, 0, 16, 8),
                            child: Text(
                              'Ingredients:',
                              style: titleStyle,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: Text(
                              widget.transaction.food.ingredients,
                              style: bodyRegularStyle,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Price',
                                      style: bodyMediumStyle,
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'id-ID',
                                              symbol: 'IDR ',
                                              decimalDigits: 0)
                                          .format(
                                              widget.transaction.food.price),
                                      style: titleStyle,
                                    )
                                  ],
                                ),
                                Container(
                                  height: 44,
                                  width: 163,
                                  margin: EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                  ),
                                  child: ElevatedButton(
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
                                    child: Text(
                                      "ORDER NOW",
                                    ),
                                    onPressed: () {
                                      Get.to(
                                        PaymentPage(
                                          transaction:
                                              widget.transaction.copyWith(
                                            quantity: quantity,
                                            total: quantity *
                                                widget.transaction.food.price,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

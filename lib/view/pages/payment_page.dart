import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tubes_apb_nih/data/cubit/cubit.dart';
import 'package:tubes_apb_nih/data/models/models.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';
import 'package:tubes_apb_nih/view/pages/map_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  PaymentPage({this.transaction});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  int selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: whiteColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Payment Details",
                          style: titleStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    color: whiteColor,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Item Ordered",
                            style: subtitleStyle.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    margin: EdgeInsets.only(right: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          widget.transaction.food.picturePath,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                198,
                                        child: Text(
                                          widget.transaction.food.name,
                                          style: subtitleStyle.copyWith(
                                            fontWeight: FontWeight.w900,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'Rp',
                                          decimalDigits: 0,
                                        ).format(widget.transaction.food.price),
                                        style: bodyRegularStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                '${widget.transaction.quantity} item(s)',
                                style: bodyRegularStyle,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 16,
                            right: 16,
                            bottom: 12,
                          ),
                          child: Text(
                            "Delivery Location",
                            style: subtitleStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.grey.withOpacity(0.1),
                                    ),
                                    child: Icon(
                                      MdiIcons.mapMarker,
                                      color: mainColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${widget.transaction.user.address}",
                                        style: subtitleStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "${widget.transaction.user.city}",
                                        style: bodyRegularStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 12,
                          ),
                          child: Text(
                            "Payment Method",
                            style: subtitleStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RadioListTile(
                                value: 1,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setState(() {
                                    selectedRadio = val;
                                  });
                                },
                                title: Text(
                                  "Cash on Delivery",
                                  style: subtitleStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  "Pay on our courier and keep safe",
                                  style: bodyRegularStyle.copyWith(
                                    color: blackColor.withOpacity(0.7),
                                  ),
                                ),
                                activeColor: mainColor,
                              ),
                              RadioListTile(
                                value: 2,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setState(() {
                                    selectedRadio = val;
                                  });
                                },
                                title: Text(
                                  "Bank Transfer",
                                  style: subtitleStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  "Choose your bank and keep safe",
                                  style: bodyRegularStyle.copyWith(
                                    color: blackColor.withOpacity(0.7),
                                  ),
                                ),
                                activeColor: mainColor,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/pattern-bg.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Color(0xFFBEBEBE),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 16,
                                  ),
                                  child: Text(
                                    "Order Info",
                                    style: subtitleStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          32 -
                                          5,
                                      child: Text(
                                        'Price',
                                        style: subtitleStyle.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          32 -
                                          5,
                                      child: Text(
                                        "${widget.transaction.quantity} x " +
                                            NumberFormat.currency(
                                              locale: 'id-ID',
                                              symbol: 'Rp',
                                              decimalDigits: 0,
                                            ).format(
                                                widget.transaction.food.price),
                                        style: subtitleStyle.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          32 -
                                          5,
                                      child: Text(
                                        'Tax 10%',
                                        style: subtitleStyle.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          32 -
                                          5,
                                      child: Text(
                                        NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'Rp',
                                          decimalDigits: 0,
                                        ).format(
                                            widget.transaction.total * 0.1),
                                        style: subtitleStyle.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          32 -
                                          5,
                                      child: Text(
                                        'Driver',
                                        style: subtitleStyle.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          32 -
                                          5,
                                      child: Text(
                                        NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'Rp',
                                          decimalDigits: 0,
                                        ).format(20000),
                                        style: subtitleStyle.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Divider(
                                    thickness: 1,
                                    color: greyColor.withOpacity(0.3),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          32 -
                                          5,
                                      child: Text(
                                        'Total Price',
                                        style: subtitleStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          32 -
                                          5,
                                      child: Text(
                                        NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'Rp',
                                          decimalDigits: 0,
                                        ).format(
                                          widget.transaction.total * 1.1 +
                                              20000,
                                        ),
                                        style: subtitleStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ],
          ),
          bottomButtonOrder(),
        ],
      ),
    );
  }

  Widget bottomButtonOrder() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: greyColor.withOpacity(0.2),
            ),
            color: whiteColor,
          ),
          child: GestureDetector(
            onTap: () async {
              setState(() {
                isLoading = true;
              });

              String paymentUrl = await context
                  .read<TransactionCubit>()
                  .submitTransaction(
                    widget.transaction.copyWith(
                      dateTime: DateTime.now(),
                      total: (widget.transaction.total * 1.1).toInt() + 50000,
                    ),
                  );

              if (paymentUrl != null) {
                Get.to(MapPage(paymentUrl));
              } else {
                setState(() {
                  isLoading = false;
                });
                Get.snackbar(
                  "",
                  "",
                  backgroundColor: redColor,
                  icon: Icon(MdiIcons.closeCircleOutline, color: Colors.white),
                  titleText: Text(
                    'Transaction Failed',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  messageText: Text(
                    'Please try again later.',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                );
              }
            },
            child: Container(
              height: 56,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: mainColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ORDER NOW",
                    style: subtitleStyle.copyWith(
                      color: whiteColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'id-ID',
                          symbol: 'Rp',
                          decimalDigits: 0,
                        ).format(
                          widget.transaction.total * 1.1 + 20000,
                        ),
                        style: subtitleStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        MdiIcons.arrowRightCircle,
                        color: whiteColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

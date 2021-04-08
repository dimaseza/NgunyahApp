import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tubes_apb_nih/data/providers/cart_provider.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          "My Cart",
          style: titleStyle,
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
      ),
      backgroundColor: Color(0xFFF9F9F9),
      body: FutureBuilder(
        future: Provider.of<CartProvider>(
          context,
          listen: false,
        ).fetchAndSetCart(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<CartProvider>(
                child: Center(
                  child: Text(
                    "No Item",
                    style: titleStyle,
                  ),
                ),
                builder: (context, cart, ch) => cart.items.length <= 0
                    ? ch
                    : Stack(
                        children: [
                          ListView(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 26,
                                  ),
                                  Container(
                                    color: whiteColor,
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    child: Column(
                                      children: cart.items
                                          .map(
                                            (e) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: 80,
                                                        width: 80,
                                                        margin: EdgeInsets.only(
                                                          right: 20,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                                e.picturePath),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            e.name,
                                                            style:
                                                                subtitleStyle,
                                                          ),
                                                          Text(
                                                            NumberFormat
                                                                .currency(
                                                              locale: "id-ID",
                                                              decimalDigits: 0,
                                                              symbol: "Rp",
                                                            ).format(e.price),
                                                            style:
                                                                bodyMediumStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    quantity--;
                                                                    if (quantity ==
                                                                        0) {
                                                                      Provider.of<CartProvider>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .deleteCart(
                                                                              e.id);
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .remove_circle_outline,
                                                                  size: 26,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 12,
                                                              ),
                                                              Text(
                                                                "$quantity",
                                                                style:
                                                                    bodyMediumStyle,
                                                              ),
                                                              SizedBox(
                                                                width: 12,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    quantity++;
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .add_circle_outline_outlined,
                                                                  size: 26,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              color: whiteColor,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Total:",
                                        style: bodyRegularStyle,
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                          locale: "id-ID",
                                          symbol: "Rp",
                                          decimalDigits: 0,
                                        ).format(
                                          cart.items.fold(
                                              0,
                                              (prev, element) =>
                                                  prev += element.subtotal),
                                        ),
                                        style: subtitleStyle.copyWith(
                                          fontSize: 18,
                                          color: mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: mainColor),
                                    child: Text(
                                      "ORDER NOW",
                                      style: bodyMediumStyle.copyWith(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
      ),
    );
  }
}

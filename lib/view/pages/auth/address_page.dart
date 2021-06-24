import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tubes_apb_nih/data/cubit/cubit.dart';
import 'package:tubes_apb_nih/data/models/models.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';
import 'package:tubes_apb_nih/view/components/components.dart';
import 'package:tubes_apb_nih/view/pages/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressPage extends StatefulWidget {
  final User user;
  final String password;
  final File pictureFile;

  AddressPage(this.user, this.password, this.pictureFile);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: buildBody(),
    );
  }

  buildBody() {
    return SafeArea(
      child: ListView(
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
                      "Address\nMake sure it's valid",
                      style: titleStyle,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Container(
                color: whiteColor,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1,
                              color: Color(0xFFBEBEBE),
                            ),
                          ),
                          hintText: "Phone Number",
                          labelText: "Phone Number",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: houseNumController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1,
                              color: Color(0xFFBEBEBE),
                            ),
                          ),
                          hintText: "House Number",
                          labelText: "House Number",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: addressController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1,
                              color: Color(0xFFBEBEBE),
                            ),
                          ),
                          hintText: "Address",
                          labelText: "Address",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: cityController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1,
                              color: Color(0xFFBEBEBE),
                            ),
                          ),
                          hintText: "City",
                          labelText: "City",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    isLoading == true
                        ? Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 24),
                            height: 45,
                            child: Center(
                              child: loadingIndicator,
                            ),
                          )
                        : CustomButton(
                            text: "Sign Up",
                            color: mainColor,
                            onPressed: () async {
                              User user = widget.user.copyWith(
                                phoneNumber: phoneController.text,
                                address: addressController.text,
                                houseNumber: houseNumController.text,
                                city: cityController.text,
                              );

                              setState(() {
                                isLoading = true;
                              });

                              await context.read<UserCubit>().signUp(
                                    user,
                                    widget.password,
                                    pictureFile: widget.pictureFile,
                                  );

                              UserState state = context.read<UserCubit>().state;

                              if (state is UserLoaded) {
                                context.read<FoodCubit>().getFoods();
                                context
                                    .read<TransactionCubit>()
                                    .getTransactions();
                                Get.offAll(
                                  MainPage(
                                    bottomNavBarIndex: 0,
                                  ),
                                );
                              } else {
                                Get.snackbar(
                                  "",
                                  "",
                                  backgroundColor: redColor,
                                  icon: Icon(
                                    MdiIcons.closeCircleOutline,
                                    color: whiteColor,
                                  ),
                                  titleText: Text(
                                    "Sign Up Failed",
                                    style: GoogleFonts.poppins(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  messageText: Text(
                                    (state as UserLoadingFailed).message,
                                    style: GoogleFonts.poppins(
                                      color: whiteColor,
                                    ),
                                  ),
                                );
                              }
                              setState(() {
                                isLoading = false;
                              });
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

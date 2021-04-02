import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';
import 'package:tubes_apb_nih/view/components/components.dart';
import 'package:tubes_apb_nih/view/pages/pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back,
                        color: blackColor,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Login Your Account",
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
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1,
                              color: Color(0xFFBEBEBE),
                            ),
                          ),
                          hintText: "Email address",
                          labelText: "Email address",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1,
                              color: Color(0xFFBEBEBE),
                            ),
                          ),
                          hintText: "Password",
                          labelText: "Password",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    CustomButton(
                      text: "Login",
                      color: mainColor,
                      onPressed: () {
                        Get.to(
                          MainPage(
                            bottomNavBarIndex: 0,
                          ),
                        );
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

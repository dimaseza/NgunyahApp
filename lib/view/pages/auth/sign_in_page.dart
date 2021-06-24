import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_apb_nih/data/cubit/cubit.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';
import 'package:tubes_apb_nih/view/components/components.dart';
import 'package:tubes_apb_nih/view/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  SharedPreferences loginData;
  bool newLogin;

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  isLogin() async {
    loginData = await SharedPreferences.getInstance();
    newLogin = (loginData.getBool('account') ?? true);

    UserState state = context.read<UserCubit>().state;

    if (state is UserLoaded) {
      context.read<FoodCubit>().getFoods();
      context.read<TransactionCubit>().getTransactions();

      Get.offAll(
        MainPage(
          bottomNavBarIndex: 0,
        ),
      );
    }
  }

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
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1,
                              color: Color(0xFFBEBEBE),
                            ),
                          ),
                          suffixIcon: Icon(MdiIcons.eye),
                          hintText: "Password",
                          labelText: "Password",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    isLoading
                        ? Container(
                            height: 45,
                            width: double.infinity,
                            child: loadingIndicator,
                          )
                        : CustomButton(
                            text: "Login",
                            color: mainColor,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });

                              await context.read<UserCubit>().signIn(
                                    emailController.text,
                                    passwordController.text,
                                  );

                              UserState state = context.read<UserCubit>().state;

                              if (state is UserLoaded) {
                                context.read<FoodCubit>().getFoods();
                                context
                                    .read<TransactionCubit>()
                                    .getTransactions();

                                loginData.setBool("account", false);

                                loginData.setString(
                                    "email", emailController.text);

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
                                    "Sign In Failed",
                                    style: bodyRegularStyle.copyWith(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  messageText: Text(
                                    (state as UserLoadingFailed).message,
                                    style: bodyRegularStyle.copyWith(
                                      color: whiteColor,
                                    ),
                                  ),
                                );
                                setState(() {
                                  isLoading = false;
                                });
                              }
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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tubes_apb_nih/data/models/models.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';
import 'package:tubes_apb_nih/view/components/components.dart';
import 'package:tubes_apb_nih/view/pages/auth/auth.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User user;
  File pictureFile;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
                      "Register and eat",
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
                    GestureDetector(
                      onTap: () async {
                        PickedFile pickedFile = await ImagePicker()
                            .getImage(source: ImageSource.gallery);
                        if (pickedFile != null) {
                          pictureFile = File(pickedFile.path);
                          setState(() {});
                        }
                      },
                      child: Container(
                        width: 110,
                        height: 110,
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/photo_border.png'),
                          ),
                        ),
                        child: (pictureFile != null)
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: FileImage(pictureFile),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/photo.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1,
                              color: Color(0xFFBEBEBE),
                            ),
                          ),
                          hintText: "Full Name",
                          labelText: "Full Name",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
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
                    CustomButton(
                      text: "Continue",
                      color: mainColor,
                      onPressed: () {
                        Get.to(
                          AddressPage(
                            User(
                              name: nameController.text,
                              email: emailController.text,
                            ),
                            passwordController.text,
                            pictureFile,
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

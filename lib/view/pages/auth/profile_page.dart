import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_apb_nih/data/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';
import 'package:tubes_apb_nih/view/components/components.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            //// Header
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 220,
                margin: EdgeInsets.only(bottom: 16),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/photo_border.png'))),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage((context
                                        .read<UserCubit>()
                                        .state as UserLoaded)
                                    .user
                                    .picturePath),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Text(
                      (context.read<UserCubit>().state as UserLoaded).user.name,
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      (context.read<UserCubit>().state as UserLoaded)
                          .user
                          .email,
                      style:
                          subtitleStyle.copyWith(fontWeight: FontWeight.w300),
                    )
                  ],
                )),
            //// Body
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    titles: ["Account", "FoodMarket"],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: ((selectedIndex == 0)
                            ? [
                                'Edit Profile',
                                'Home Address',
                                'Security',
                                'Payment'
                              ]
                            : [
                                'Rate App',
                                'Help Center',
                                'Privacy & Policy',
                                'Term & Condition'
                              ])
                        .map((e) => Padding(
                              padding: EdgeInsets.only(
                                  bottom: 16, left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    e,
                                    style: subtitleStyle,
                                  ),
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Image.asset(
                                      'assets/images/right_arrow.png',
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ],
    );
  }
}

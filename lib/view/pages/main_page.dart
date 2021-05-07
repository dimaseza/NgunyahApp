import 'package:flutter/material.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';
import 'package:tubes_apb_nih/view/pages/about_food/about_food.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;

  MainPage({this.bottomNavBarIndex});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  buildBody() {
    return Stack(
      children: [
        Container(
          color: Color(0xFFF9F9F9),
        ),
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              bottomNavBarIndex = index;
            });
          },
          children: [
            FoodPage(),
            SearchFoodPage(),
            HistoryFoodPage(),
            Center(
              child: Text("Profile Page"),
            ),
          ],
        ),
        createCustomBottomNavBar(),
      ],
    );
  }

  Widget createCustomBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: whiteColor,
          ),
          child: BottomNavigationBar(
            selectedItemColor: mainColor,
            unselectedItemColor: greyColor,
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: bottomNavBarIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              bottomNavBarIndex = index;
              pageController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Search",
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                label: "History",
                icon: Icon(Icons.history),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      );
}

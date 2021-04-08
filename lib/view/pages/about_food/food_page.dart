import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_apb_nih/data/models/models.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';
import 'package:tubes_apb_nih/view/components/cards/cards.dart';
import 'package:tubes_apb_nih/view/components/components.dart';
import 'package:tubes_apb_nih/view/pages/about_food/about_food.dart';
import 'package:tubes_apb_nih/view/pages/pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  buildBody() {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            buildCard1(),
            SizedBox(
              height: 20,
            ),
            buildTabFood(),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ],
    );
  }

  buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://thumbs.dreamstime.com/b/handsome-man-hair-style-beard-beauty-face-portrait-fashion-male-model-black-hair-high-resolution-handsome-man-125031765.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dimas Imameza",
                    style: titleStyle,
                  ),
                  Text(
                    "Ready to order food?",
                    style: subtitleStyle.copyWith(color: greyColor),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.to(CartPage());
            },
            child: IconBadge(),
          ),
        ],
      ),
    );
  }

  buildCard1() {
    return Container(
      color: whiteColor,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Paling Laris di Sekitarmu",
              style: titleStyle,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: double.infinity,
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: mockFoods
                      .map(
                        (food) => Padding(
                          padding: EdgeInsets.only(
                            left: (food == mockFoods.first) ? 16 : 0,
                            right: 16,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                DetailFoodPage(
                                  food: food,
                                  onBackButtonPressed: () {
                                    Get.back();
                                  },
                                ),
                              );
                            },
                            child: FoodCard(food),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildTabFood() {
    return Container(
      width: double.infinity,
      color: whiteColor,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CustomTabBar(
            titles: ['New Taste', 'Popular', 'Recommended'],
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
          Builder(
            builder: (_) {
              List<Food> foods = (selectedIndex == 0)
                  ? mockFoods
                  : (selectedIndex == 1)
                      ? []
                      : [];

              return Column(
                children: foods
                    .map(
                      (food) => Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: GestureDetector(
                          onTap: () {},
                          child: FoodCardList(
                            food: food,
                            itemWidth:
                                MediaQuery.of(context).size.width - 2 * 16,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

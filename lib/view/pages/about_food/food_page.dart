import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tubes_apb_nih/data/cubit/cubit.dart';
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
            child: BlocBuilder<FoodCubit, FoodState>(
              builder: (_, state) => (state is FoodLoaded)
                  ? ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: state.foods
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
                                          transaction: Transaction(
                                            food: food,
                                            user: (context
                                                    .read<UserCubit>()
                                                    .state as UserLoaded)
                                                .user,
                                          ),
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
                    )
                  : Center(
                      child: loadingIndicator,
                    ),
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
          BlocBuilder<FoodCubit, FoodState>(
            builder: (_, state) {
              if (state is FoodLoaded) {
                List<Food> foods = state.foods
                    .where(
                      (element) => element.types.contains(
                        (selectedIndex == 0)
                            ? FoodType.new_food
                            : (selectedIndex == 1)
                                ? FoodType.popular
                                : FoodType.recommended,
                      ),
                    )
                    .toList();

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
              } else {
                return Center(
                  child: loadingIndicator,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

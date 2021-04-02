import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tubes_apb_nih/data/models/models.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  FoodCard(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 0.5,
          color: greyColor,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 20,
            color: whiteColor.withOpacity(0.9),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              image: DecorationImage(
                image: NetworkImage(food.picturePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 8),
            width: 170,
            child: Text(
              food.name,
              style: subtitleStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12),
            width: 170,
            child: Text(
              NumberFormat.currency(
                symbol: "Rp",
                decimalDigits: 0,
                locale: "ID-id",
              ).format(food.price),
              style: bodyRegularStyle.copyWith(
                color: blackColor.withOpacity(0.8),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

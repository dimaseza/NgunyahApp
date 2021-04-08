import 'package:flutter/material.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';

class IconBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.shopping_cart,
          size: 32,
          color: blackColor,
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: redColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "1",
                style: captionStyle.copyWith(
                  fontSize: 10,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

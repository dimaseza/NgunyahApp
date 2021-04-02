import 'package:flutter/material.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  CustomTabBar({
    @required this.titles,
    this.selectedIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            height: 1,
            color: whiteColor,
          ),
          Row(
            children: titles
                .map(
                  (title) => Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (onTap != null) {
                              onTap(titles.indexOf(title));
                            }
                          },
                          child: Text(
                            title,
                            style: (titles.indexOf(title) == selectedIndex)
                                ? subtitleStyle.copyWith(
                                    fontWeight: FontWeight.w600)
                                : subtitleStyle.copyWith(
                                    color: Color(0xFFBEBEBE),
                                  ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 3,
                          margin: EdgeInsets.only(top: 13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.5),
                            color: (titles.indexOf(title) == selectedIndex)
                                ? mainColor
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

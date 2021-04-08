import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_apb_nih/data/models/models.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';

class SearchFoodPage extends StatefulWidget {
  @override
  _SearchFoodPageState createState() => _SearchFoodPageState();
}

class _SearchFoodPageState extends State<SearchFoodPage> {
  TextEditingController searchController = TextEditingController();
  // bool firstSearch = true;
  // String query = "";

  // List<Food> filterFood = [];
  // @override
  // void initState() {
  //   super.initState();
  //   mockFoods.sort();
  // }

  // searchView() {
  //   searchController.addListener(() {
  //     if (searchController.text.isEmpty) {
  //       setState(() {
  //         firstSearch = true;
  //         query = "";
  //       });
  //     } else {
  //       setState(() {
  //         firstSearch = false;
  //         query = searchController.text;
  //       });
  //     }
  //   });
  // }

  // createListSearch() {
  //   return Container(
  //     height: 100,
  //     child: ListView.builder(
  //       itemCount: mockFoods.length,
  //       itemBuilder: (context, index) {
  //         return Text(
  //           mockFoods[index].name,
  //         );
  //       },
  //     ),
  //   );
  // }

  // performSearch() {
  //   for (int i = 0; i < mockFoods.length; i++) {
  //     var item = mockFoods[i];

  //     if (item.name.toLowerCase().contains(query.toLowerCase())) {
  //       filterFood.add(item);
  //     }
  //   }

  //   return filterList();
  // }

  // filterList() {
  //   return Container(
  //     height: 100,
  //     child: ListView.builder(
  //       itemCount: filterFood.length,
  //       itemBuilder: (_, index) {
  //         return Text(filterFood[index].name);
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search Food",
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: searchController,
                    cursorColor: mainColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFF9F9F9),
                      hintText: "What do you want to eat today?",
                      prefixIcon: Icon(
                        Icons.search,
                        color: greyColor,
                      ),
                      hintStyle: GoogleFonts.poppins(),
                      labelStyle: GoogleFonts.poppins(),
                    ),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  // Text(
                  //   "Popular search",
                  //   style: titleStyle.copyWith(fontSize: 18),
                  // ),
                  // firstSearch ? createListSearch() : performSearch(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

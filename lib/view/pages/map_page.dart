import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_apb_nih/view/pages/pages.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Map Page"),
            ElevatedButton(
              onPressed: () {
                Get.to(SuccessPage());
              },
              child: Text("Order Now"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tubes_apb_nih/data/helpers/db_helper.dart';
import 'package:tubes_apb_nih/data/models/models.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _items = [];

  List<Cart> get items {
    return [..._items];
  }

  void increment() {}

  Cart findById(int id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addToCart(
    int id,
    String picturePath,
    String name,
    String description,
    String ingredients,
    int price,
    double rate,
    int qty,
  ) {
    final newCart = Cart(
      id: id,
      picturePath: picturePath,
      name: name,
      description: description,
      ingredients: ingredients,
      price: price,
      rate: rate,
      qty: qty,
    );

    _items.add(newCart);
    notifyListeners();
    DBHelper.insert('cart_food', {
      'id': newCart.id,
      'picturePath': newCart.picturePath,
      'name': newCart.name,
      'description': newCart.description,
      'ingredients': newCart.ingredients,
      'price': newCart.price,
      'rate': newCart.rate,
      'qty': qty,
    });
  }

  Future<void> deleteCart(int id) {
    DBHelper.delete('cart_food', id);
  }

  Future<void> fetchAndSetCart() async {
    final dataList = await DBHelper.getData('cart_food');
    _items = dataList
        .map(
          (item) => Cart(
            id: item['id'],
            picturePath: item['picturePath'],
            name: item['name'],
            description: item['description'],
            ingredients: item['ingredients'],
            price: item['price'],
            rate: item['rate'],
            qty: item['qty'],
          ),
        )
        .toList();
    notifyListeners();
  }
}

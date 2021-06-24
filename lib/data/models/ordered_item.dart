import 'package:equatable/equatable.dart';
import 'package:tubes_apb_nih/data/models/models.dart';

class OrderedItem extends Equatable {
  final Food food;
  final int quantity;

  OrderedItem({this.food, this.quantity});

  @override
  List<Object> get props => [food, quantity];
}

List<OrderedItem> mockItem = [
  OrderedItem(
    food: mockFoods[1],
    quantity: 3,
  ),
  OrderedItem(
    food: mockFoods[3],
    quantity: 5,
  ),
  OrderedItem(
    food: mockFoods[2],
    quantity: 1,
  ),
];

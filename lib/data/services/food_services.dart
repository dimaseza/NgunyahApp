import 'package:tubes_apb_nih/data/models/models.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods() async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockFoods);
  }
}

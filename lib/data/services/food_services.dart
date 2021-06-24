import 'dart:convert';

import 'package:tubes_apb_nih/data/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:tubes_apb_nih/data/services/services.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseUrl + 'food';

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Food> foods = (data['data']['data'] as Iterable)
        .map((food) => Food.fromJson(food))
        .toList();

    return ApiReturnValue(value: foods);
  }
}

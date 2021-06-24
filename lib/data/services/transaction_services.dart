import 'dart:convert';

import 'package:tubes_apb_nih/data/models/api_return_value.dart';
import 'package:tubes_apb_nih/data/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:tubes_apb_nih/data/services/services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseUrl + 'transaction/?limit=1000';

    var response = await client.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${User.token}"
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Transaction> transactions = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();

    return ApiReturnValue(value: transactions);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseUrl + 'checkout';

    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${User.token}"
      },
      body: jsonEncode(
        <String, dynamic>{
          'food_id': transaction.food.id,
          'user_id': transaction.user.id,
          'quantity': transaction.quantity,
          'total': transaction.total,
          'status': 'PENDING',
        },
      ),
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Transaction value = Transaction.fromJson(data['data']);

    return ApiReturnValue(value: value);
  }
}

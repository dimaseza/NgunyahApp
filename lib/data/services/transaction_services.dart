import 'package:tubes_apb_nih/data/models/api_return_value.dart';
import 'package:tubes_apb_nih/data/models/models.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    await Future.delayed(Duration(seconds: 3));

    return ApiReturnValue(value: mockTransactions);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction) async {
    await Future.delayed(Duration(seconds: 2));

    // return ApiReturnValue(message: "Transaksi Gagal");
    return ApiReturnValue(
      value: transaction.copyWith(
        id: 123,
        status: TransactionStatus.pending,
      ),
    );
  }
}

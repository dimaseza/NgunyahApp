import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tubes_apb_nih/data/cubit/cubit.dart';
import 'package:tubes_apb_nih/data/models/models.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';
import 'package:tubes_apb_nih/view/components/components.dart';

class HistoryFoodPage extends StatefulWidget {
  @override
  _HistoryFoodPageState createState() => _HistoryFoodPageState();
}

class _HistoryFoodPageState extends State<HistoryFoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (_, state) {
        if (state is TransactionLoaded) {
          if (state.transactions.length == 0) {
            return Text("No Foods");
          } else {
            double listItemWidth = MediaQuery.of(context).size.width - 2 * 16;

            return ListView(
              children: [
                Column(
                  children: [
                    // Header
                    Container(
                      height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      color: whiteColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your Orders",
                            style: titleStyle,
                          ),
                          Text(
                            "Wait for the best meal",
                            style: subtitleStyle.copyWith(
                              color: blackColor.withOpacity(0.6),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Body
                    Container(
                      width: double.infinity,
                      color: whiteColor,
                      child: Column(
                        children: [
                          CustomTabBar(
                            titles: ['In Progress', 'Past Orders'],
                            selectedIndex: selectedIndex,
                            onTap: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Builder(
                            builder: (_) {
                              List<Transaction> transactions = (selectedIndex ==
                                      0)
                                  ? state.transactions
                                      .where((element) =>
                                          element.status ==
                                              TransactionStatus.on_delivery ||
                                          element.status ==
                                              TransactionStatus.pending)
                                      .toList()
                                  : state.transactions
                                      .where((element) =>
                                          element.status ==
                                              TransactionStatus.delivered ||
                                          element.status ==
                                              TransactionStatus.cancelled)
                                      .toList();

                              return Column(
                                children: transactions
                                    .map(
                                      (transaction) => Padding(
                                        padding: EdgeInsets.only(
                                          right: 16,
                                          left: 16,
                                          bottom: 16,
                                        ),
                                        child: OrderListItem(
                                          transaction: transaction,
                                          itemWidth: listItemWidth,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        } else {
          return Center(
            child: loadingIndicator,
          );
        }
      },
    );
  }
}

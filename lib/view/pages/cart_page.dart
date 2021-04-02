import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_apb_nih/data/models/models.dart';
import 'package:tubes_apb_nih/data/providers/cart_provider.dart';
import 'package:tubes_apb_nih/shared/theme/theme.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: mainColor,
      ),
      body: FutureBuilder(
        future: Provider.of<CartProvider>(
          context,
          listen: false,
        ).fetchAndSetCart(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<CartProvider>(
                    child: Center(
                      child: Text(
                        "No Item",
                        style: titleStyle,
                      ),
                    ),
                    builder: (context, cart, ch) => cart.items.length <= 0
                        ? ch
                        : ListView(
                            children: [
                              Column(
                                children: cart.items
                                    .map(
                                      (e) => Column(
                                        children: [
                                          ListTile(
                                            leading: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                  icon: Icon(Icons.remove),
                                                  onPressed: () {
                                                    e.qty--;
                                                    if (e.qty == 0) {
                                                      e.props.clear();
                                                      return;
                                                    }
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(Icons.add),
                                                  onPressed: () {
                                                    e.qty++;
                                                  },
                                                ),
                                              ],
                                            ),
                                            title: Text(e.name),
                                            subtitle: Text(
                                                "${e.qty} x ${e.price} = ${e.subtotal}"),
                                            trailing: IconButton(
                                              icon: Icon(Icons.delete),
                                              onPressed: () {
                                                Provider.of<CartProvider>(
                                                        context,
                                                        listen: false)
                                                    .deleteCart(e.id);
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 26,
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                              Center(
                                child: Text(
                                    "TOTAL: ${cart.items.fold(0, (prev, element) => prev += element.subtotal)}"),
                              ),
                            ],
                          ),
                  ),
      ),
    );
  }
}

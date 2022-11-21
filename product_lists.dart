import 'package:flutter/material.dart';
import '../models/cart.dart';

class ProductList extends StatelessWidget {
  final List<Cart> carts;

  ProductList(this.carts);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: carts.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No Transaction Data",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        child: Text(
                          carts[index].qty.toString(),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            carts[index].title.toString(),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            'Harga: Rp' + carts[index].harga.toString(),
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: carts.length,
            ),
    );
  }
}

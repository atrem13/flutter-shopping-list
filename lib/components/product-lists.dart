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
              children: [
                Text(
                  'Belum ada data',
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.title,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        child: Text(
                          carts[index].qty.toString(),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            carts[index].title,
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            'Harga: Rp' + carts[index].harga.toStringAsFixed(0),
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
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

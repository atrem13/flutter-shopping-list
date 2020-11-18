import 'package:flutter/material.dart';
import '../models/cart.dart';

class Dashboard extends StatelessWidget {
  final List<Cart> _listCart;
  Dashboard(this._listCart);

  int get totalItem {
    return _listCart.fold(0, (sum, item) {
      return sum += item.qty;
    });
  }

  double get totalPrice {
    return _listCart.fold(0, (sum, item) => sum += item.harga);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'Total Item',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  totalItem.toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'Total Harga',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Rp.' + totalPrice.toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

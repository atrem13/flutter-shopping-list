import 'package:flutter/material.dart';
import 'components/product-lists.dart';
import 'models/cart.dart';
import 'components/dashboard.dart';
import 'components/add-new-item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.blueAccent,
          textTheme: ThemeData.light().textTheme.copyWith(
                  // ignore: deprecated_member_use
                  title: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ))),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Cart> _carts = [
    Cart(id: 'DW1', title: 'Sabun Mandi', harga: 15000, qty: 1),
    Cart(id: 'DW2', title: 'Shampoo', harga: 17000, qty: 2),
  ];

  void _openModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddNewItem(_addNewItem);
        });
  }

  void _addNewItem(String title, double harga, int qty) {
    final newItem = Cart(
      id: DateTime.now().toString(),
      title: title,
      harga: harga,
      qty: qty,
    );

    setState(() {
      _carts.add(newItem);
    });
  }

  void _resetCarts() {
    setState(() {
      _carts.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () => _resetCarts(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Dashboard(_carts),
            Dashboard(_carts),
            ProductList(_carts),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openModal(context),
      ),
    );
  }
}

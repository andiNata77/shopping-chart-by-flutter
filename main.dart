import 'package:flutter/material.dart';
import './components/dashboard.dart';
import './components/product_lists.dart';
import './components/add_new_item.dart';
import './models/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shopping Bag",
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.lightBlue,
          accentColor: Color.fromARGB(255, 2, 69, 255),
          textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
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
        id: DateTime.now().toString(), title: title, harga: harga, qty: qty);
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
        title: Text(
          "Daftar Belanjaan",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            child: Icon(
              Icons.clear,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () => _resetCarts(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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

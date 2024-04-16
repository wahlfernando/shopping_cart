import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'src/feature/shooping_card/widgets/card_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shooping Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JsonCrudPage(),
    );
  }
}

class JsonCrudPage extends StatefulWidget {
  const JsonCrudPage({super.key});

  @override
  _JsonCrudPageState createState() => _JsonCrudPageState();
}

class _JsonCrudPageState extends State<JsonCrudPage> {
  late List<dynamic> products;
  List<dynamic> cart = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final jsonString = await rootBundle.loadString('assets/json/product.json');
    setState(() {
      products = json.decode(jsonString);
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CartPage(cart: cart, removeFromCart: removeFromCart),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${product['name']} added to cart')),
              );
            },
            child: Card(
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(product['image']),
                ),
                title: Text(product['name']),
                subtitle: Text(product['detail']),
                trailing: Text('\$${product['price']}'),
              ),
            ),
          );
        },
      ),
    );
  }
}

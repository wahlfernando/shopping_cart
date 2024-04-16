import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<dynamic> cart;
  final Function(int) removeFromCart;

  const CartPage({
    super.key,
    required this.cart,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(product['image']),
            ),
            title: Text(product['name']),
            subtitle: Text(product['detail']),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                removeFromCart(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('${product['name']} removed from cart')),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Total Price: \$${getTotalPrice().toStringAsFixed(2)}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  double getTotalPrice() {
    return cart.fold(0, (total, current) => total + double.parse(current['price']));
  }
}

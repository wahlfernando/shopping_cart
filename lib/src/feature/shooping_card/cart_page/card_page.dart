import 'package:flutter/material.dart';
import 'package:test_shooping/src/feature/shooping_card/home/home_controller.dart';
import 'package:get/get.dart';

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
        title: const Text('Carrinho de compras'),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return ListView.builder(
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
                  icon: const Icon(Icons.remove_shopping_cart),
                  onPressed: () {
                    removeFromCart(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1),
                        backgroundColor: Colors.red[100],
                        content: Text(
                          '${product['name']} removido do carrinho!!',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                    controller.update();
                  },
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Valor Total: \$${getTotalPrice().toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  double getTotalPrice() {
    return cart.fold(
        0, (total, current) => total + double.parse(current['price']));
  }

}

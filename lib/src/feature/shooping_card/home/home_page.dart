// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:test_shooping/src/feature/shooping_card/home/home_controller.dart';
import 'package:get/get.dart';

import '../cart_page/card_page.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Productos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                      cart: controller.cart,
                      removeFromCart: controller.removeFromCart),
                ),
              );
              controller.calculateTotalPrice();
            },
          ),
        ],
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.products?.length,
            itemBuilder: (context, index) {
              controller.loadProducts();
              final product = controller.products?[index];
              return GestureDetector(
                onTap: () {
                  controller.addToCart(product);
                  controller.calculateTotalPrice();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      backgroundColor: Colors.green[200],
                      content: Text(
                        '${product['name']} adicionado ao carrinho!',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.all(8.0),
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
          );
        },
      ),
    );
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:test_shooping/src/utils/components/btn_add_card.dart';
import 'package:get/get.dart';
import '../../cart_page/card_page.dart';
import '../home_controller.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;
  final HomeController controller = Get.put(HomeController());

  ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
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
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product['image'],
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Detalhes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(product['detail']),
            const SizedBox(height: 16.0),
            const Text(
              'Preço:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('R\$${product['price']}'),
            if (product['offer'] != null) ...[
              const SizedBox(height: 16.0),
              const Text(
                'Offer:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(product['offer']),
            ],
            const SizedBox(
              height: 32,
            ),
            BtnAddCard(
              onTap: () {
                controller.addToCart(product);
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
            )
          ],
        ),
      ),
    );
  }
}

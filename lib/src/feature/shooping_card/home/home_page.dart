// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:test_shooping/src/feature/shooping_card/home/home_controller.dart';
import 'package:get/get.dart';

import '../cart_page/card_page.dart';
import 'widgets/card_produt.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
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
              return CardProdut(
                product: product,
                controller: controller,
              );
            },
          );
        },
      ),
    );
  }
}

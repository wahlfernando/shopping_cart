// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:test_shooping/src/feature/shooping_card/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:test_shooping/src/feature/shooping_card/home/widgets/product_detail.dart';

class CardProdut extends StatelessWidget {
  final product;
  HomeController controller = Get.put(HomeController());
  CardProdut({super.key, required this.product, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                product: product,
              ),
            ),
          );
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[350],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(product['image']),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'],
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(product['detail']),
                  ],
                ),
                const Spacer(),
                Text('R\$${product['price']}'),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

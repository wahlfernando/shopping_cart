import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<dynamic>? products = [];
  List<dynamic> cart = [];

  @override
  void onInit() async {
    super.onInit();
    await loadProducts();
  }

  Future<void> loadProducts() async {
    final jsonString = await rootBundle.loadString('assets/json/product.json');
    products = json.decode(jsonString);
    update();
  }

  void addToCart(Map<String, dynamic> product) {
    cart.add(product);
    update();
  }

  void removeFromCart(int index) {
    cart.removeAt(index);
    update();
  }


}

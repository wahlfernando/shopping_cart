
class ShoopingCardController {
  Future<void> saveProducts() async {
    final file = File('assets/json/product.json');

    await file.writeAsString(json.encode(products));
  }

  void addProduct(Map<String, dynamic> product) {
    setState(() {
      products.add(product);
    });
    saveProducts();
  }

  void updateProduct(int index, Map<String, dynamic> product) {
    setState(() {
      products[index] = product;
    });
    saveProducts();
  }

  void deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
    saveProducts();
  }

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      cart.add(product);
    });
  }

  void removeFromCart(int index) {
    setState(() {
      cart.removeAt(index);
    });
  }

  double getTotalPrice() {
    return cart.fold(
        0, (total, current) => total + double.parse(current['price']));
  }

}
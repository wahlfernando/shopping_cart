import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
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
            Text('\$${product['price']}'),
            if (product['offer'] != null) ...[
              const SizedBox(height: 16.0),
              const Text(
                'Offer:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(product['offer']),
            ],
          ],
        ),
      ),
    );
  }
}
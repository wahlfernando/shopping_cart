import 'package:flutter/material.dart';

class BtnAddCard extends StatelessWidget {
  final Function()? onTap;
  const BtnAddCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.green),
        child: const Center(
          child: Text(
            'Adicionar ao Carrinho',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

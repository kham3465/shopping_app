import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  final Map<String, dynamic> product;

 const Cart({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['itemName']),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              product['linkImage'],
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 16),
          Text(
            product['description'],
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            product['price'],
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
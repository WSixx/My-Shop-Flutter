import 'package:flutter/material.dart';
import 'package:my_shop/models/products.dart';
import 'package:my_shop/providers/counter_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Products products =
        ModalRoute.of(context).settings.arguments as Products;
    return Scaffold(
      appBar: AppBar(
        title: Text(products.title),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              print(CounterProvider.of(context));
            },
            child: Text("+"),
          ),
        ],
      ),
    );
  }
}

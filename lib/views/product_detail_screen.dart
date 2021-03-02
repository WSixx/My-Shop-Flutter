import 'package:flutter/material.dart';
import 'file:///E:/flutter/my_shop/lib/providers/product.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product products =
        ModalRoute.of(context).settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(products.title),
      ),
    );
  }
}

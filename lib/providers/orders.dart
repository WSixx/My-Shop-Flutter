import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:http/http.dart' as http;

class Order {
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  Order({this.id, this.total, this.products, this.date});
}

class Orders with ChangeNotifier {
  final String _baseUrl = 'myshop-b8edb-default-rtdb.firebaseio.com';

  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> addOrder(Cart cart) async {
    //final total = products.fold(0.0, (t, i) => t + (i.price * i.quantity));
    final date = DateTime.now();
    final response = await http.post(
      Uri.https(_baseUrl, 'orders.json'),
      body: json.encode({
        'total': cart.totalAmount,
        'date': date.toIso8601String(),
        'products': cart.items.values
            .map((cartItem) => {
                  'id': cartItem.id,
                  'productId': cartItem.productId,
                  'title': cartItem.title,
                  'quantity': cartItem.quantity,
                  'price': cartItem.price,
                })
            .toList(),
      }),
    );
    _items.insert(
      0,
      Order(
        id: json.decode(response.body)['name'],
        total: cart.totalAmount,
        date: DateTime.now(),
        products: cart.items.values.toList(),
      ),
    );
    notifyListeners();
  }
}

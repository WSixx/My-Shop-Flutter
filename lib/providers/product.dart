import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavorite() async {
    _toggleFavorite();

    try {
      final String url = 'myshop-b8edb-default-rtdb.firebaseio.com';
      final response = await http.patch(
        Uri.https(url, 'products/$id.json'),
        body: json.encode({
          'isFavorite': isFavorite,
        }),
      );
      if (response.statusCode >= 400) {
        _toggleFavorite();
      }
    } catch (error) {
      _toggleFavorite();
    }
  }

  void _toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

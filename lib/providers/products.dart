import 'package:flutter/material.dart';
import 'package:my_shop/data/dummy_data.dart';
import 'file:///E:/flutter/my_shop/lib/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items => [..._items];
  List<Product> get favoritesItems {
    return _items.where((produto) => produto.isFavorite).toList();
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}

//bool _showFavoriteOnly = false;

/* void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }*/

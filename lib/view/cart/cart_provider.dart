import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> book) {
    _cartItems.add(book);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> book) {
    _cartItems.remove(book);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(
        0, (total, item) => total + (item['price'] as double));
  }

  void updateQuantity(Map<String, dynamic> book, int quantity) {
    final index = _cartItems.indexWhere((item) => item['id'] == book['id']);
    if (index != -1) {
      _cartItems[index]['quantity'] = quantity;
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

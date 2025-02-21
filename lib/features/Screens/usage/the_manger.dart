import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavoriteManager {
  final GetStorage _storage = GetStorage();

  // Constructor
  FavoriteManager() {
    if (!_storage.hasData('favorites')) {
      _storage.write('favorites', []);
    }
  }

  List<Map<String, dynamic>> getFavorites() {
    return List<Map<String, dynamic>>.from(_storage.read('favorites'));
  }

  bool isFavorite(String productName) {
    List<Map<String, dynamic>> favorites = getFavorites();
    return favorites.any((item) => item['name'] == productName);
  }

  void toggleFavorite(String productName, String imageUrl,double productPrice) {
    List<Map<String, dynamic>> favorites = getFavorites();

    if (isFavorite(productName)) {
      favorites.removeWhere((item) => item['name'] == productName);
    } else {
      favorites.add({"name": productName, "image": imageUrl, "price": productPrice});
    }

    _storage.write('favorites', favorites);
  }
}

class ShoppingManager {
  final GetStorage _storage = GetStorage();

  ShoppingManager() {
    if (!_storage.hasData('shoppingCart')) {
      _storage.write('shoppingCart', []);
    }
  }

  List<Map<String, dynamic>> getCartItems() {
    return List<Map<String, dynamic>>.from(_storage.read('shoppingCart'));
  }

  void addToCart(String productName, String imageUrl, double quantity) {
    if (quantity <= 0) {
      Get.snackbar(
        'Error',
        'Please select a quantity greater than zero.',
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    List<Map<String, dynamic>> cartItems = getCartItems();

    bool exists = cartItems.any((item) => item['name'] == productName);
    if (exists) {
      Get.snackbar(
        'Error',
        '$productName is already in the cart.',
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        
        margin: const EdgeInsets.all(16),
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    cartItems.add({
      'name': productName,
      'image': imageUrl,
      'quantity': quantity,
    });
    Get.snackbar(
      "Done!",
      '$productName added to cart!',
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      snackPosition: SnackPosition.BOTTOM,
    );

    _storage.write('shoppingCart', cartItems);
  }
}

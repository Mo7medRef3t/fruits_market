import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:fruits_market/core/constants.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  final box = GetStorage();
  List<Map<String, dynamic>> shoppingCart = [];

  @override
  void initState() {
    super.initState();
    loadShoppingCart();
  }

  void loadShoppingCart() {
    shoppingCart = (box.read('shoppingCart') as List<dynamic>?)
            ?.cast<Map<String, dynamic>>() ??
        [];
    setState(() {});
  }

  void removeItem(int index) {
    setState(() {
      shoppingCart.removeAt(index);
      box.write('shoppingCart', shoppingCart);
    });
  }

  void updateQuantity(int index, double quantity) {
    setState(() {
      shoppingCart[index]['quantity'] = quantity;
      box.write('shoppingCart', shoppingCart);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: KMainColor,
      ),
      body: shoppingCart.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: shoppingCart.length,
              itemBuilder: (context, index) {
                String productName = shoppingCart[index]['name'];
                String imageUrl = shoppingCart[index]['image'];
                double quantity = shoppingCart[index]['quantity'];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(imageUrl, width: 50, height: 50),
                    title: Text(productName),
                    subtitle: Text('Quantity: $quantity'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => removeItem(index),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
          },
          child: const Text('Proceed to Checkout'),
        ),
      ),
    );
  }
}

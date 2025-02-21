import 'package:flutter/material.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key, required this.productName, required this.onQuantityChanged});
  final String productName; 
  final Function(double) onQuantityChanged;

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  Map<String, double> productQuantities = {};
  late double quantity;

  @override
  void initState() {
    super.initState();
    quantity = productQuantities[widget.productName] ?? 0;
  }

  void updateQuantity(String productName, double quantity) {
    setState(() {
      productQuantities[productName] = quantity;
      this.quantity = quantity;
    });
     widget.onQuantityChanged(quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            if (quantity > 0) {
              updateQuantity(widget.productName, quantity - 0.25);
            }
          },
        ),
        Text(
          "$quantity",
          style: const TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            updateQuantity(widget.productName, quantity + 0.25);
          },
        ),
      ],
    );
  }
}

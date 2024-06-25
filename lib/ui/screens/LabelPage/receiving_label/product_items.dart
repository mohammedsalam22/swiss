import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/LabelPage/receiving_label/product.dart';

class ProductItem extends StatelessWidget {
  final Products product;
  final ValueChanged<int> onQuantityChanged;

  const ProductItem(
      {super.key, required this.product, required this.onQuantityChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        elevation: 2,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: ListTile(
          leading: Image.asset(
            product.imageUrl,
            width: 100,
          ),
          title: Text(product.name),
          subtitle: Row(
            children: [
              Text('Quantity: ${product.quantity}'),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (product.quantity > 1) {
                    onQuantityChanged(product.quantity - 1);
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  onQuantityChanged(product.quantity + 1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
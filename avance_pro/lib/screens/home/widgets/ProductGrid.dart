import 'package:avance_pro/screens/home/widgets/ProductCart.dart';
import 'package:flutter/material.dart';
import '../../../models/product.dart';


// widgets/product_grid.dart
class ProductGrid extends StatelessWidget {
  final List<Product> items;
  const ProductGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        // antes: .78  -> deja poco alto y revienta
        childAspectRatio: 0.68, // más alto = ya no overflow
      ),
      itemBuilder: (_, i) => ProductCard(p: items[i]),
    );
  }
}
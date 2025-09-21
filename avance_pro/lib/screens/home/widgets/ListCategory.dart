import 'package:avance_pro/models/Category.dart';
import 'package:flutter/material.dart';


class CategoryList extends StatelessWidget {
  final List<Category> items;
  const CategoryList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (_, i) {
          final c = items[i];
          return Column(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(c.imageUrl),
              ),
              const SizedBox(height: 6),
              Text(c.name, style: const TextStyle(fontSize: 12)),
            ],
          );
        },
      ),
    );
  }
}
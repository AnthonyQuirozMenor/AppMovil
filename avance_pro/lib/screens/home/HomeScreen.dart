import 'package:avance_pro/data/Data.dart';
import 'package:avance_pro/screens/home/widgets/Banner.dart';
import 'package:avance_pro/screens/home/widgets/ListCategory.dart';
import 'package:avance_pro/screens/home/widgets/ProductGrid.dart';
import 'package:avance_pro/screens/home/widgets/QuickActions.dart';
import 'package:avance_pro/screens/home/widgets/SearchBar.dart';
import 'package:avance_pro/screens/home/widgets/SectionHeader.dart';
import 'package:avance_pro/widgets/NavBar.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final content = SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeSearchBar(),
            const SizedBox(height: 12),
            const QuickActions(),
            const SizedBox(height: 16),

            BannerCarousel(images: banners),
            const SizedBox(height: 18),

            const SectionHeader(title: 'Title'),
            const SizedBox(height: 10),
            CategoryList(items: categories),
            const SizedBox(height: 16),

            const SectionHeader(title: 'Title'),
            const SizedBox(height: 10),
            ProductGrid(items: products),
          ],
        ),
      ),
    );

    // Envolvemos con el bottom nav
    return BottomNavScaffold(home: content);
  }
}
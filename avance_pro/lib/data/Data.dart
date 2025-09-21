

import 'package:avance_pro/models/Category.dart';
import 'package:avance_pro/models/product.dart';

final banners = <String>[
  'https://images.unsplash.com/photo-1517260911058-0fcfd733702f',
  'https://images.unsplash.com/photo-1511690656952-34342bb7c2f2',
  'https://images.unsplash.com/photo-1502741338009-cac2772e18bc',
];

final categories = <Category>[
  Category(
    id: 'c1',
    name: 'Peras',
    imageUrl: 'https://images.unsplash.com/photo-1516685018646-549198525c1b',
  ),
  Category(
    id: 'c2',
    name: 'Sandía',
    imageUrl: 'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce',
  ),
  Category(
    id: 'c3',
    name: 'Vegetales',
    imageUrl: 'https://images.unsplash.com/photo-1506806732259-39c2d0268443',
  ),
  Category(
    id: 'c4',
    name: 'Hongos',
    imageUrl: 'https://images.unsplash.com/photo-1472145246862-b24cf25c4a36',
  ),
  Category(
    id: 'c5',
    name: 'Cerezas',
    imageUrl: 'https://images.unsplash.com/photo-1464965911861-746a04b4bca6',
  ),
];

final products = <Product>[
  Product(
    id: 'p1',
    brand: 'Brand',
    name: 'Product name',
    price: 10.99,
    imageUrl: 'https://images.unsplash.com/photo-1528825871115-3581a5387919',
  ),
  Product(
    id: 'p2',
    brand: 'Brand',
    name: 'Product name',
    price: 10.99,
    imageUrl: 'https://images.unsplash.com/photo-1506806732259-39c2d0268443',
  ),
  Product(
    id: 'p3',
    brand: 'Brand',
    name: 'Product name',
    price: 10.99,
    imageUrl: 'https://images.unsplash.com/photo-1472145246862-b24cf25c4a36',
  ),
  Product(
    id: 'p4',
    brand: 'Brand',
    name: 'Product name',
    price: 10.99,
    imageUrl: 'https://images.unsplash.com/photo-1464965911861-746a04b4bca6',
  ),
];
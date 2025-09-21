import 'package:flutter/material.dart';

class Final extends StatelessWidget {
  final double size;

  const Final({super.key, this.size = 120.0});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/arma.png',
      width: size,
      height: size,
    );
  }
}
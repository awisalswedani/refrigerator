import 'package:flutter/material.dart';

class SelectImage extends StatelessWidget {
  final String image;
  const SelectImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Image.asset(image));
  }
}

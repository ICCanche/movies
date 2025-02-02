import 'package:flutter/material.dart';

class PlaceholderImage extends StatelessWidget {
  final double height;

  const PlaceholderImage({super.key, this.height = 400});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.grey,
      child: const Center(
        child: Icon(Icons.image_not_supported, size: 50),
      ),
    );
  }
}
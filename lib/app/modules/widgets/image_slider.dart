import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final String src;
  const ImageSlider({super.key, required this.src});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      fit: BoxFit.cover,
    );
  }
}
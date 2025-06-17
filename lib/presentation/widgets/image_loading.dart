import 'package:flutter/material.dart';

class ImageLoading extends StatelessWidget {
  const ImageLoading({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/img/circle-loading.gif',
      placeholderFit: BoxFit.scaleDown,
      image: "$imageUrl.jpg",
      fit: BoxFit.cover,
      placeholderScale: 2.0,
      width: double.infinity,
    );
  }
}

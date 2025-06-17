import 'package:flutter/material.dart';
import 'package:lol_app/app/utils/env.dart';

class SliderTopImageContent extends StatelessWidget {
  const SliderTopImageContent({
    super.key,
    required this.championId,
  });
  final String championId;
  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/img/circle-loading.gif',
      placeholderFit: BoxFit.scaleDown,
      placeholderScale: 1.5,
      fit: BoxFit.cover,
      image: "${Environment.imageApi}${championId}_0.jpg",
    );
  }
}

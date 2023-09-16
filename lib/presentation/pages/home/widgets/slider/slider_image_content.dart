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
    return Hero(
      tag: 'img-skill',
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/img/circle-loading.gif',
        placeholderScale: 1.5,
        image: "${Environment.imageApi}${championId}_0.jpg",
      ),
    );
  }
}

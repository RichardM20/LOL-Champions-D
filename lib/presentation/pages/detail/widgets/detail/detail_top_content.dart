import 'package:flutter/material.dart';

import 'detail_difficulty_content.dart';
import '../foregorund_content.dart';
import '../icon_back_content.dart';
import 'detail_image_champion_content.dart';

class DetailTopContent extends StatelessWidget {
  const DetailTopContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TweenAnimationBuilder(
          tween: Tween(begin: 1.0, end: 0.0),
          duration: const Duration(milliseconds: 350),
          builder: (context, value, child) => Transform.translate(
            offset: Offset(0.0, -50 * value),
            child: const DetailImageTopContent(),
          ),
        ),
        const ForergroundBlackContent(),
        const DifficultyIconContent(),
        const DifficultyTextContent(),
        const IconBackContent(),
      ],
    );
  }
}

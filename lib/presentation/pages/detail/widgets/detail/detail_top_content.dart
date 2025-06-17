import 'package:flutter/material.dart';
import 'package:lol_app/presentation/widgets/tween_aniamtion.dart';

import '../foregorund_content.dart';
import '../icon_back_content.dart';
import 'detail_difficulty_content.dart';
import 'detail_image_champion_content.dart';

class DetailTopContent extends StatelessWidget {
  const DetailTopContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TweenAnimationWidget(
          direction: AnimationDirection.top,
          duration: const Duration(milliseconds: 350),
          child: const DetailImageTopContent(),
        ),
        const ForergroundBlackContent(),
        const DifficultyIconContent(),
        const DifficultyTextContent(),
        const IconBackContent(),
      ],
    );
  }
}

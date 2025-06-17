import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lol_app/presentation/widgets/tween_aniamtion.dart';

class IconBackContent extends StatelessWidget {
  const IconBackContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      left: 15,
      child: TweenAnimationWidget(
        direction: AnimationDirection.top,
        child: Transform.translate(
          offset: const Offset(5, 0.0),
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
      ),
    );
  }
}

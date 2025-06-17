import 'package:flutter/material.dart';
import 'package:lol_app/app/utils/font_app.dart';
import 'package:lol_app/presentation/widgets/tween_aniamtion.dart';

class TitleTabbarContent extends StatelessWidget {
  const TitleTabbarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationWidget(
      direction: AnimationDirection.top,
      duration: const Duration(milliseconds: 350),
      child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            "Choose your champion",
            style: TextStyle(
            fontSize: 25,
              fontFamily: FontFamilyApp.bold,
            ),
          ),
        ),
    
    );
  }
}

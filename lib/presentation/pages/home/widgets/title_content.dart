import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/font_app.dart';

class TitleTabbarContent extends StatelessWidget {
  const TitleTabbarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: const Duration(milliseconds: 350),
      builder: (context, value, child) => Transform.translate(
        offset: Offset(0.0, -100 * value),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            "Choose your champion",
            style: TextStyle(
              fontSize: 25.spMin,
              fontFamily: FontFamilyApp.bold,
            ),
          ),
        ),
      ),
    );
  }
}

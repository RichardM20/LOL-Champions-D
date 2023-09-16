import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/colors_app.dart';
import 'package:lol_app/app/utils/font_app.dart';

class CarouselTextSkinNameContent extends StatelessWidget {
  const CarouselTextSkinNameContent({
    super.key,
    required this.skinName,
  });

  final String skinName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: ColorsApp.secondaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        skinName,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamilyApp.regular,
          fontSize: 15.spMin,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/font_app.dart';
import 'package:lol_app/domain/models/champion_detail_data_model.dart';

class NameAbilityModalContent extends StatelessWidget {
  const NameAbilityModalContent({
    super.key,
    required this.spell,
  });

  final Spell? spell;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: [
          TextSpan(
            text: spell!.name ?? "",
            style: TextStyle(
              fontFamily: FontFamilyApp.bold,
              fontSize: 15.spMin,
            ),
          ),
          TextSpan(
            text: "\nCooldown: \n",
            style: TextStyle(
              fontFamily: FontFamilyApp.bold,
              fontSize: 15.spMin,
            ),
          ),
          TextSpan(
            text: "${spell!.cooldown}",
            style: TextStyle(
              overflow: TextOverflow.clip,
              fontFamily: FontFamilyApp.medium,
              fontSize: 15.spMin,
            ),
          )
        ],
      ),
    );
  }
}

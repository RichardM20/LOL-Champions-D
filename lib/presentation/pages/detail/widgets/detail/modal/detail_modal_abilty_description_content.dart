import 'package:flutter/material.dart';
import 'package:lol_app/app/utils/font_app.dart';
import 'package:lol_app/domain/models/champion_detail_data_model.dart';

class DescriptionAbilityModalContent extends StatelessWidget {
  const DescriptionAbilityModalContent({
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
            text: "\nDescription: ",
            style: TextStyle(
              fontFamily: FontFamilyApp.bold,
              fontSize: 15,
            ),
          ),
          TextSpan(
            text: "${spell!.description}",
            style: TextStyle(
              overflow: TextOverflow.clip,
              fontFamily: FontFamilyApp.medium,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}

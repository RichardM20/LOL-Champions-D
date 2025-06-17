import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/colors_app.dart';
import 'package:lol_app/domain/models/champion_detail_data_model.dart';

import 'detail_modal_ability_image_content.dart';
import 'detail_modal_ability_tooltip_content.dart';
import 'detail_modal_abilty_description_content.dart';
import 'detail_modal_abilty_name_content.dart';
import 'icon_close_modal_content.dart';

class ModalAbilitieContent extends StatelessWidget {
  const ModalAbilitieContent({
    super.key,
    required this.champion,
    required this.index,
  });

  final int index;
  final Champion? champion;

  @override
  Widget build(BuildContext context) {
    assert(champion != null, 'Champion cannot be null');
    final spell = champion!.spells![index];

    return Container(
      height: 320.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
      decoration: BoxDecoration(
        color: ColorsApp.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Row(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageAbilitieContent(id: spell.id),
                    NameAbilityModalContent(spell: spell),
                  ],
                ),
                DescriptionAbilityModalContent(spell: spell),
                ToolTipAbilityModalContent(spell: spell),
              ],
            ),
            const IconCloseModalAbilities(),
          ],
        ),
      ),
    );
  }
}

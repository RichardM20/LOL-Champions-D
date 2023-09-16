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
    return Container(
      height: 320.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 35,
      ),
      decoration: BoxDecoration(
        color: ColorsApp.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageAbilitieContent(
                      id: champion!.spells![index].id,
                    ),
                    const SizedBox(width: 10),
                    NameAbilityModalContent(
                      spell: champion!.spells![index],
                    )
                  ],
                ),
                DescriptionAbilityModalContent(
                  spell: champion!.spells![index],
                ),
                ToolTipAbilityModalContent(
                  spell: champion!.spells![index],
                )
              ],
            ),
            const IconCloseModalAbilities()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_app/app/utils/font_app.dart';
import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';
import 'package:lol_app/presentation/widgets/tween_aniamtion.dart';

import 'modal/detail_modal_ability_content.dart';
import 'modal/detail_modal_ability_image_content.dart';

class DetailAbilitiContent extends StatelessWidget {
  const DetailAbilitiContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final champion = context.read<DetailPageCubit>().state.championDetail;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Abilities",
          style: TextStyle(
            fontFamily: FontFamilyApp.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 24,
          children: List.generate(
            champion!.spells!.length,
            (index) => GestureDetector(
              onTap: () => showBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                builder: (context) => ModalAbilitieContent(
                  champion: champion,
                  index: index,
                ),
              ),
              child: TweenAnimationWidget(
                direction: AnimationDirection.top,
                duration: const Duration(milliseconds: 350),
                child: ImageAbilitieContent(
                  id: champion.spells![index].id,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

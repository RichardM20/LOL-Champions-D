import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_app/app/utils/difficulty.dart';
import 'package:lol_app/app/utils/font_app.dart';
import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';
import 'package:lol_app/presentation/widgets/tween_aniamtion.dart';

class DifficultyTextContent extends StatelessWidget {
  const DifficultyTextContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final champion = context.read<DetailPageCubit>().state.championDetail;
    return Positioned(
      bottom: 50,
      left: 30,
      child: TweenAnimationWidget(
        direction: AnimationDirection.top,
        duration: const Duration(milliseconds: 350),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "${champion!.name}\n",
              style: TextStyle(
                color: Colors.white,
                height: 3.0,
                fontSize: 30,
                fontFamily: FontFamilyApp.bold,
              ),
            ),
            TextSpan(
              children: List.generate(
                champion.tags!.length,
                (index) => TextSpan(
                  text: "${champion.tags![index]} ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: FontFamilyApp.medium,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class DifficultyIconContent extends StatelessWidget {
  const DifficultyIconContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final champion = context.read<DetailPageCubit>().state.championDetail;
    return Positioned(
      bottom: 50,
      right: 30,
      child: TweenAnimationWidget(
        direction: AnimationDirection.top,
        duration: const Duration(milliseconds: 450),
        child: Column(
          children: [
            Row(
              children: List.generate(
                3,
                (index) => Container(
                  height: 5,
                  margin: const EdgeInsets.only(right: 5),
                  width: 25,
                  decoration: BoxDecoration(
                    color: diffColor(
                      champion!.info!.difficulty ?? 0,
                      index,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "Difficulty",
              style: TextStyle(
                height: 1.8,
                color: Colors.white,
                fontSize: 15,
                fontFamily: FontFamilyApp.bold,
              ),
            ),
            Text(
              diff(
                champion!.info!.difficulty ?? 0,
              ),
              style: TextStyle(
                height: 1.3,
                color: Colors.grey.shade400,
                fontSize: 15,
                fontFamily: FontFamilyApp.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/colors_app.dart';
import 'package:lol_app/app/utils/font_app.dart';

import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';

class StatisticsChampionContent extends StatelessWidget {
  const StatisticsChampionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final champion = context.read<DetailPageCubit>().state.championDetail;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Statistics",
          style: TextStyle(
            fontFamily: FontFamilyApp.bold,
            fontSize: 15.spMin,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatictisGeneralContent(
              label: 'Attak',
              v: champion!.info!.attack!,
              color: Colors.red,
            ),
            StatictisGeneralContent(
              label: 'Magic',
              v: champion.info!.magic!,
              color: Colors.blue,
            ),
            StatictisGeneralContent(
              label: 'Defense',
              color: Colors.amber,
              v: champion.info!.defense!,
            ),
          ],
        )
      ],
    );
  }
}

class StatictisGeneralContent extends StatelessWidget {
  const StatictisGeneralContent({
    super.key,
    required this.v,
    required this.label,
    required this.color,
  });

  final int v;
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: TweenAnimationBuilder(
            tween: Tween(begin: 1.0, end: 0.0),
            duration: const Duration(milliseconds: 350),
            builder: (context, value, child) => Transform.translate(
              offset: Offset(-30 * value, 0.0),
              child: Row(
                children: [
                  Text(
                    "$label: \t\t",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilyApp.medium,
                      fontSize: 15.spMin,
                      height: 1.5,
                      color: Colors.white,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      '$v',
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontFamily: FontFamilyApp.medium,
                        fontSize: 15.spMin,
                        height: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: TweenAnimationBuilder(
            tween: Tween(begin: 1.0, end: 0.0),
            duration: const Duration(milliseconds: 350),
            builder: (context, value, child) => Transform.translate(
              offset: Offset(30 * value, 0.0),
              child: StatisticsPorcentContent(
                color: color,
                value: v,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class StatisticsPorcentContent extends StatelessWidget {
  const StatisticsPorcentContent({
    super.key,
    required this.value,
    required this.color,
  });
  final int value;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      decoration: BoxDecoration(
        color: ColorsApp.secondaryColorDark,
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: value / 10,
        child: Container(
          color: color,
        ),
      ),
    );
  }
}

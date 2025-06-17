import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/font_app.dart';
import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';
import 'package:lol_app/presentation/widgets/tween_aniamtion.dart';

class DetailAbountContent extends StatelessWidget {
  const DetailAbountContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final champion = context.read<DetailPageCubit>().state.championDetail;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About",
          style: TextStyle(
            fontFamily: FontFamilyApp.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20.h),
        TweenAnimationWidget(
          direction: AnimationDirection.top,
          duration: const Duration(milliseconds: 350),
          child: Text(
            champion!.lore ?? "",
            style: TextStyle(
              fontFamily: FontFamilyApp.medium,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/font_app.dart';

import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';

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
            fontSize: 15.spMin,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20.h),
        TweenAnimationBuilder(
          tween: Tween(begin: 1.0, end: 0.0),
          duration: const Duration(milliseconds: 350),
          builder: (context, value, child) => Transform.translate(
            offset: Offset(0.0, 30 * value),
            child: Text(
              champion!.lore ?? "",
              style: TextStyle(
                fontFamily: FontFamilyApp.medium,
                fontSize: 15.spMin,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

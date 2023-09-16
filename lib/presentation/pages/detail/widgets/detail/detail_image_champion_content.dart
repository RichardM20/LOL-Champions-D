import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/env.dart';

import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';

class DetailImageTopContent extends StatelessWidget {
  const DetailImageTopContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final champion = context.read<DetailPageCubit>().state.championDetail;
    return Hero(
      tag: 'img-skill',
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/img/circle-loading.gif',
        image: '${Environment.imageApi}${champion!.id}_0.jpg',
        filterQuality: FilterQuality.high,
        width: double.infinity,
        height: 250,
        fit: BoxFit.fill,
      ),
    );
  }
}

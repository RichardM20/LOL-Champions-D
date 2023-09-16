import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/colors_app.dart';
import 'package:lol_app/app/utils/env.dart';
import 'package:lol_app/app/utils/font_app.dart';
import 'package:lol_app/domain/models/champion_detail_data_model.dart';
import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';

import 'carousel_name_skin_content.dart';

class CarouselSkinContent extends StatelessWidget {
  const CarouselSkinContent({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DetailPageCubit>();
    return SizedBox(
      height: 200,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        onPageChanged: (int page) {
          cubit.changeIndexPage(page);
        },
        controller: pageController,
        itemCount: cubit.state.championDetail!.skins!.length,
        itemBuilder: (context, index) {
          final champion = cubit.state.championDetail!;
          return Stack(
            children: [
              Center(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/img/circle-loading.gif',
                  placeholderFit: BoxFit.contain,
                  image:
                      "${Environment.imageApi}${champion.id}_${champion.skins![index].num}.jpg",
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 50,
                right: 50,
                child: CarouselTextSkinNameContent(
                  skinName: champion.skins![index].name ?? "",
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

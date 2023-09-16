import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_app/app/utils/colors_app.dart';
import 'package:lol_app/app/utils/font_app.dart';
import 'package:lol_app/domain/models/champion_detail_data_model.dart';
import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';
import 'package:lol_app/presentation/blocs/detail/detail_state.dart';

class SkinCarouselTopContent extends StatelessWidget {
  const SkinCarouselTopContent({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Skins",
          style: TextStyle(
            fontFamily: FontFamilyApp.bold,
            fontSize: 15.spMin,
            color: Colors.white,
          ),
        ),
        BlocBuilder<DetailPageCubit, DetailState>(builder: (context, state) {
          return Row(
            children: [
              GestureDetector(
                onTap:
                    state.championDetail!.skins!.isEmpty || state.indexPage == 0
                        ? () {}
                        : () => pageController.previousPage(
                              duration: const Duration(
                                milliseconds: 250,
                              ),
                              curve: Curves.easeIn,
                            ),
                child: Icon(
                  Icons.arrow_back,
                  color: state.indexPage! < 1
                      ? Colors.grey
                      : ColorsApp.secondaryColor,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: state.championDetail!.skins!.isEmpty ||
                        state.indexPage ==
                            state.championDetail!.skins!.length - 1
                    ? () {}
                    : () => pageController.nextPage(
                          duration: const Duration(
                            milliseconds: 250,
                          ),
                          curve: Curves.linear,
                        ),
                child: Icon(
                  color:
                      state.indexPage == state.championDetail!.skins!.length - 1
                          ? Colors.grey
                          : ColorsApp.secondaryColor,
                  Icons.arrow_forward_outlined,
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}

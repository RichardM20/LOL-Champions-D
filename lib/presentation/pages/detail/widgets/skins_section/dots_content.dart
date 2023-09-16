import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_app/app/utils/colors_app.dart';

import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';
import 'package:lol_app/presentation/blocs/detail/detail_state.dart';

class DotsCarouselSkinContent extends StatelessWidget {
  const DotsCarouselSkinContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DetailPageCubit>();
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: List.generate(
            cubit.state.championDetail!.skins!.length,
            (index) => BlocBuilder<DetailPageCubit, DetailState>(
                builder: (context, state) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeIn,
                decoration: BoxDecoration(
                  color: index == state.indexPage
                      ? ColorsApp.secondaryColor
                      : const Color.fromARGB(255, 5, 47, 62),
                  borderRadius: BorderRadius.circular(100),
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                height: 10,
                width: 10,
              );
            }),
          ),
        ),
      ),
    );
  }
}

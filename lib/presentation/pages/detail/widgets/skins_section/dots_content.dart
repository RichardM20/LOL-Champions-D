import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_app/app/utils/colors_app.dart';
import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';
import 'package:lol_app/presentation/blocs/detail/detail_state.dart';

class DotsCarouselSkinContent extends StatelessWidget {
  const DotsCarouselSkinContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: BlocBuilder<DetailPageCubit, DetailState>(
          builder: (context, state) {
            final skins = state.championDetail?.skins ?? [];
            final currentIndex = state.indexPage ?? 0;

            return Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(
                skins.length,
                (index) => _CarouselDot(
                  isActive: index == currentIndex,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CarouselDot extends StatelessWidget {
  const _CarouselDot({required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
      height: 10,
      width: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: isActive
            ? ColorsApp.secondaryColor
            : const Color.fromARGB(255, 5, 47, 62),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_app/app/utils/colors_app.dart';
import 'package:lol_app/app/utils/font_app.dart';
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
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        BlocBuilder<DetailPageCubit, DetailState>(
          builder: (context, state) {
            final skins = state.championDetail?.skins ?? [];
            final isFirstPage = state.indexPage == 0;
            final isLastPage = state.indexPage == skins.length - 1;

            return Row(
              spacing: 24,
              children: [
                _NavigationArrow(
                  icon: Icons.arrow_back_ios_new,
                  isEnabled: skins.isNotEmpty && !isFirstPage,
                  onPressed: () {
                    if (!isFirstPage) {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                ),
                _NavigationArrow(
                  icon: Icons.arrow_forward_ios_sharp,
                  isEnabled: skins.isNotEmpty && !isLastPage,
                  onPressed: () {
                    if (!isLastPage) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.linear,
                      );
                    }
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _NavigationArrow extends StatelessWidget {
  const _NavigationArrow({
    required this.icon,
    required this.isEnabled,
    required this.onPressed,
  });

  final IconData icon;
  final bool isEnabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: isEnabled ? onPressed : null,
        child: Icon(
          icon,
          color: isEnabled ? ColorsApp.secondaryColor : Colors.grey,
        ),
      ),
    );
  }
}

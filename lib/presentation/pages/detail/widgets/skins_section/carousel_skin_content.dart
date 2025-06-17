import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_app/app/utils/env.dart';
import 'package:lol_app/presentation/blocs/detail/detail_cubit.dart';
import 'package:lol_app/presentation/widgets/image_loading.dart';

import 'carousel_name_skin_content.dart';

class CarouselSkinContent extends StatelessWidget {
  const CarouselSkinContent({
    super.key,
    required this.pageController,
    required this.maxWidth,
  });

  final PageController pageController;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DetailPageCubit>();
    final champion = cubit.state.championDetail!;

    return SizedBox(
      height: 200,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        onPageChanged: (int page) {
          cubit.changeIndexPage(page);
        },
        controller: pageController,
        padEnds: maxWidth < 600,
        itemCount: champion.skins!.length,
        itemBuilder: (context, index) {
          final skin = champion.skins![index];
          final imageUrl = '${Environment.imageApi}${champion.id}_${skin.num}';

          return Container(
            height: 400,
            width: 300,
            margin: const EdgeInsets.only(right: 24),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (_, __, ___) =>
                            _FullScreenImageView(imageUrl: imageUrl),
                      ),
                    );
                  },
                  child: Hero(
                    tag: imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: ImageLoading(imageUrl: imageUrl),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 50,
                  right: 50,
                  child: CarouselTextSkinNameContent(
                    skinName: skin.name ?? "",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _FullScreenImageView extends StatelessWidget {
  const _FullScreenImageView({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: imageUrl,
              child: ImageLoading(imageUrl: imageUrl),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
